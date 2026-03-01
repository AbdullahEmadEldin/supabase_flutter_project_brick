class AppConstants {
  // Env key =
  static const String url = 'SUPABASE_URL';
  static const String anonKey = 'SUPABASE_ANON_KEY';
  static const String webClientId = 'WEB_CLIENT_ID';
  static const String serverBaseUrl = 'SERVER_BASE_URL';
  static const String serviceRoleKey = 'SUPABASE_SERVICE_ROLE_KEY';

  //
  static const String translationsPath = 'assets/translations';
}

class SupabaseBuckets {
  static const String sessions = 'sessions';
  static const String tasks = 'tasks';
  static const String opps = 'opportunities';
  static const String conversations = 'conversations';
}

class SharedPrefKeys {
  static String lang = 'lang';
  static String isDark = 'isDark';
  static String firstLaunch = 'firstLaunch';
  static String playbackSpeed = 'playbackSpeed';
}
