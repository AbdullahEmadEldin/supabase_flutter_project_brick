import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../networking/failure_model.dart';
import '../networking/supabase_error_handler.dart';

/// Resolves an async function into Either<Failure, T>.
/// Left(Failure) on any error, Right(T) on success.
Future<Either<Failure, T>> resolveSupabaseAsync<T>(
  Future<T> Function() target,
) async {
  try {
    final result = await target();
    return Right(result);
  } on PostgrestException catch (e) {
    return Left(SupabaseErrorHandler().handlePostgrestError(e));
  } on StorageException catch (e) {
    return Left(SupabaseErrorHandler().handleStorageError(e));
  } on AuthException catch (e) {
    return Left(SupabaseErrorHandler().handleAuthError(e));
  } on SocketException catch (e) {
    return Left(SupabaseErrorHandler().handleSocketError(e));
  } on TimeoutException catch (e) {
    return Left(SupabaseErrorHandler().handleTimeoutError(e));
  } on Exception catch (e) {
    return Left(SupabaseErrorHandler().handleUnexpectedError(e));
  } catch (e) {
    return Left(SupabaseErrorHandler().handleUnexpectedError(e));
  }
}
