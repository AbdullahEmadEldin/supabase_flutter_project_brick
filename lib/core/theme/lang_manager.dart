import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../services/cache.dart' show CacheHelper;

class AppConstants {
  // Env key =
  static const String url = 'SUPABASE_URL';
  static const String anonKey = 'SUPABASE_ANON_KEY';
  static const String webClientId = 'WEB_CLIENT_ID';

  //
  static const String translationsPath = 'assets/translations';
}

class SharedPrefKeys {
  static String lang = 'lang';
  static String isDark = 'isDark';
  static String firstLaunch = 'firstLaunch';
}

enum LanguageType {
  english('en'),
  arabic('ar');

  final String code;

  const LanguageType(this.code);
}

class LanguageManager {
  static final ValueNotifier<Locale> _localeNotifier = ValueNotifier<Locale>(
    const Locale('ar'),
  );

  static ValueNotifier<Locale> get localeNotifier => _localeNotifier;

  static Future<void> changeAppLang(
    BuildContext context, {
    required LanguageType lang,
  }) async {
    await CacheHelper.saveData(key: SharedPrefKeys.lang, value: lang.code);
    final newLocale = Locale(lang.code);
    context.setLocale(newLocale);
    _localeNotifier.value = newLocale;
  }

  static Future<String> getAppLang() async {
    return await CacheHelper.getData(key: SharedPrefKeys.lang) ??
        LanguageType.arabic.code;
  }

  static void initializeLocale() async {
    final langCode = await getAppLang();
    _localeNotifier.value = Locale(langCode);
  }
}
