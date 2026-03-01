import 'package:flutter/material.dart';

import 'colors/app_color_scheme.dart';
import 'text_styles/text_styles_scheme.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode theme) => emit(theme);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    return ThemeMode.values[json['theme'] as int];
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {'theme': state.index};
  }
}
class AppThemes {
  /// define a singleton instance
  /// Singleton instance

  //! ----------------------------------- light theme -----------------------------------
  //
  static ThemeData lightAppTheme() {
    final appLightColors = AppColorScheme.light;
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: appLightColors.primary,
        primary: appLightColors.primary,
        brightness: Brightness.light,
      ),
      extensions: [appLightColors, AppTextStylesScheme.light],
      fontFamily: AppFonts.notoKufiArabic,
    );
  }

  static ThemeData darkAppTheme() {
    final appDarkColors = AppColorScheme.dark;
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: appDarkColors.primary,
        primary: appDarkColors.primary,
        brightness: Brightness.dark,
      ),
      extensions: [appDarkColors, AppTextStylesScheme.dark],
      fontFamily: AppFonts.notoKufiArabic,
    );
  }
}

class AppFonts {
  static const String alex = 'Alexandria';
  static const String notoKufiArabic = 'NotoKufiArabic';
}
