import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/modules/auth/data/auth_repo.dart';
import 'package:{{project_name}}/modules/auth/data/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

void setupDI() {
  getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo());
}

void registerProfile(UserModel profile) {
  if (getIt.isRegistered<UserModel>()) {
    getIt.unregister<UserModel>();
  }
  getIt.registerSingleton<UserModel>(profile);
}
