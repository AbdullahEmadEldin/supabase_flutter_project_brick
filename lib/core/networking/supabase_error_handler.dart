import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'failure_model.dart';

class SupabaseErrorHandler {
  // Singleton pattern
  static final SupabaseErrorHandler _instance =
      SupabaseErrorHandler._internal();
  factory SupabaseErrorHandler() => _instance;
  SupabaseErrorHandler._internal();

  /// Handle PostgrestException (Supabase Data API errors)
  Failure handlePostgrestError(PostgrestException error) {
    log(
      'Error Handler:: Supabase error:${error.code} == ${error.message} =====',
    );

    // Common Postgrest error codes
    switch (error.code) {
      case '23505': // Unique violation
        return Failure(error: error, message: 'This record already exists.');
      case '23503': // Foreign key violation
        return Failure(
          error: error,
          message:
              'This operation would break data relationships.\n There is Question that are related to this category.',
        );
      case '42P01': // Undefined table
        return Failure(
          error: error,
          message: 'The requested data table does not exist.',
        );
      case '42501': // Insufficient privilege
        return Failure(error: error, message: error.message);
      case '23514': // Check violation
        return Failure(
          error: error,
          message: 'This data doesn\'t meet validation requirements.',
        );
      default:
        if (error.message.contains('JWT')) {
          return Failure(
            error: error,
            message: 'Your session has expired. Please sign in again.',
          );
        }
        return Failure(
          error: error,
          message: 'Database error: ${error.message}',
        );
    }
  }

  /// Handle AuthException (Supabase Auth API errors)
  Failure handleAuthError(AuthException error) {
    log('Error Handler:: Auth error:${error.toString()} =====');

    switch (error.statusCode) {
      case "400":
        if (error.message.contains('email already confirmed')) {
          return Failure(
            error: error,
            message: 'This email is already confirmed.',
          );
        } else if (error.message.contains('invalid login credentials')) {
          return Failure(error: error, message: 'Invalid email or password.');
        } else if (error.message.contains('Email not confirmed')) {
          return Failure(
            error: error,
            message: 'Please confirm your email before signing in.',
          );
        }
        return Failure(
          error: error,
          message: 'Invalid request: ${error.message}',
        );
      case "401":
        return Failure(error: error, message: 'Please sign in again.');
      case "403":
        return Failure(error: error, message: error.message);
      case "404":
        return Failure(error: error, message: 'User not found.');
      case "422":
        return Failure(error: error, message: error.message);
      case "429":
        return Failure(
          error: error,
          message: 'Too many requests. Please try again later.',
        );
      default:
        return Failure(
          error: error,
          message: 'Authentication error: ${error.message}',
        );
    }
  }

  /// Handle StorageException (Supabase Storage API errors)
  Failure handleStorageError(StorageException error) {
    log(
      'Error Handler:: Storage error:${error.statusCode} == ${error.message} =====',
    );

    if (error.statusCode == "400") {
      return Failure(error: error, message: 'Invalid file or request.');
    } else if (error.statusCode == "401") {
      return Failure(error: error, message: 'Please sign in to upload files.');
    } else if (error.statusCode == "403") {
      return Failure(
        error: error,
        message: 'You don\'t have permission to access this file.',
      );
    } else if (error.statusCode == "404") {
      return Failure(
        error: error,
        message: 'The requested file was not found.',
      );
    } else if (error.statusCode == "413") {
      return Failure(
        error: error,
        message: 'The file is too large. Maximum size is 50MB.',
      );
    }

    return Failure(
      error: error,
      message: 'File storage error: ${error.message}',
    );
  }

  /// Handle network errors
  Failure handleSocketError(SocketException error) {
    log('Error Handler:: Network error: ${error.message} =====');
    return Failure(
      error: error,
      message:
          'Network connection issue. Please check your internet connection.',
    );
  }

  /// Handle Timeout Error
  Failure handleTimeoutError(TimeoutException error) {
    log('Error Handler:: Timeout error: ${error.message} =====');
    return Failure(
      error: error,
      message: 'Request timed out. Please try again.',
    );
  }

  /// Handle unexpected errors
  Failure handleUnexpectedError(dynamic error) {
    log('Error Handler:: Unexpected error: ${error.toString()} =====');
    return Failure(
      error: error,
      message: 'An unexpected error occurred. Please try again later.',
    );
  }
}
