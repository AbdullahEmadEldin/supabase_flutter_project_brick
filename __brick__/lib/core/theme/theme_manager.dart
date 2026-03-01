import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'colors/app_color_scheme.dart';
import 'text_styles/text_styles_scheme.dart';

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
  static ThemeData lightAppTheme() {
    final colors = AppColorScheme.light;
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: colors.primary,
        primary: colors.primary,
        brightness: Brightness.light,
      ),
      extensions: [colors, AppTextStylesScheme.light],
      fontFamily: AppFonts.ibmPlexSansArabic,
    );
  }

  static ThemeData darkAppTheme() {
    final colors = AppColorScheme.dark;
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: colors.primary,
        primary: colors.primary,
        brightness: Brightness.dark,
      ),
      extensions: [colors, AppTextStylesScheme.dark],
      fontFamily: AppFonts.ibmPlexSansArabic,
    );
  }
}
