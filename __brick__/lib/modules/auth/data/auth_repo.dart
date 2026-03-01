import 'package:dartz/dartz.dart';
import 'package:{{project_name}}/core/di/di.dart';
import 'package:{{project_name}}/core/networking/failure_model.dart';
import 'package:{{project_name}}/core/networking/resolve_async.dart';
import 'package:{{project_name}}/modules/auth/data/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepo {
  Future<Either<Failure, UserModel>> fetchProfile() async {
    if (getIt<SupabaseClient>().auth.currentUser == null) {
      return Left(Failure(error: 'User is not authenticated', message: ''));
    }
    return await resolveSupabaseAsync(() async {
      final user = await getIt<SupabaseClient>()
          .from('profiles')
          .select('*, subscriptions:subscriptions(*)')
          .eq('id', getIt<SupabaseClient>().auth.currentUser!.id)
          .single();
      return UserModel.fromJson(user);
    });
  }

  Future<Either<Failure, UserModel>> registerUser(UserModel newUser) async {
    return await resolveSupabaseAsync(() async {
      final result = await getIt<SupabaseClient>().auth.signUp(
        email: newUser.email!,
        password: newUser.password!,
        emailRedirectTo: 'io.supabase.flutterquickstart://login-callback/',
        data: {
          'full_name': newUser.name,
          'phone_number': newUser.phoneNumber,
        },
      );
      return UserModel(
        id: result.user?.id,
        email: result.user?.email,
        name: result.user?.userMetadata?['full_name'],
        phoneNumber: newUser.phoneNumber,
      );
    });
  }

  Future<Either<Failure, UserModel>> signIn(
    String email,
    String password,
  ) async {
    return await resolveSupabaseAsync(() async {
      final result = await getIt<SupabaseClient>().auth.signInWithPassword(
        email: email,
        password: password,
      );
      final profile = await fetchProfile();
      return profile.fold(
        (failure) => UserModel(
          id: result.user?.id,
          email: result.user?.email,
          name: result.user?.userMetadata?['full_name'],
        ),
        (profile) => profile,
      );
    });
  }

  Future<Either<Failure, UserModel>> uploadDeviceId(String deviceId) async {
    return await resolveSupabaseAsync(() async {
      final result = await getIt<SupabaseClient>().auth.updateUser(
        UserAttributes(data: {'device_id': deviceId}),
      );
      await getIt<SupabaseClient>()
          .from('profiles')
          .update({'device_id': deviceId})
          .eq('id', result.user!.id);
      return UserModel(
        id: result.user?.id,
        email: result.user?.email,
        name: result.user?.userMetadata?['full_name'],
      );
    });
  }

  Future<void> logout() async {
    await getIt<SupabaseClient>().auth.signOut();
  }
}
