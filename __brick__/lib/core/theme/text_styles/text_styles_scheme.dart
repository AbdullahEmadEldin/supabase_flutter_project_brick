import 'package:flutter/material.dart';

import '../colors/app_color_scheme.dart';
import 'app_text_styles.dart';

/// Single source of truth for font family names.
/// The family name must match the `family:` key in pubspec.yaml.
class AppFonts {
  static const String ibmPlexSansArabic = 'IBMPlexSansArabic';
}

abstract class AppTextStylesScheme {
  static AppTextStyles light = AppTextStyles(
    h1: TextStyle(
      fontSize: 36,
      height: 1.29,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.light.background,
      fontFamily: AppFonts.ibmPlexSansArabic,
    ),
    h2: TextStyle(
      fontSize: 20,
      height: 1.55,
      fontWeight: FontWeight.w500,
      color: AppColorScheme.light.background,
      fontFamily: AppFonts.ibmPlexSansArabic,
    ),
    title: TextStyle(
      fontSize: 16,
      height: 1.58,
      fontWeight: FontWeight.w500,
      color: AppColorScheme.light.background,
      fontFamily: AppFonts.ibmPlexSansArabic,
    ),
    subtitle: TextStyle(
      fontSize: 14,
      height: 1.5,
      fontWeight: FontWeight.normal,
      color: AppColorScheme.light.background,
      fontFamily: AppFonts.ibmPlexSansArabic,
    ),
    caption: TextStyle(
      fontSize: 10,
      height: 1.6,
      fontWeight: FontWeight.normal,
      color: AppColorScheme.light.background,
      fontFamily: AppFonts.ibmPlexSansArabic,
    ),
    buttons: TextStyle(
      fontSize: 12,
      height: 1.42,
      fontWeight: FontWeight.w500,
      color: AppColorScheme.light.background,
      fontFamily: AppFonts.ibmPlexSansArabic,
    ),
    small: TextStyle(
      fontSize: 12,
      height: 1.5,
      fontWeight: FontWeight.normal,
      color: AppColorScheme.light.background,
      fontFamily: AppFonts.ibmPlexSansArabic,
    ),
  );

  static AppTextStyles dark = AppTextStyles(
    h1: TextStyle(
      fontSize: 28,
      height: 1.29,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.dark.background,
      fontFamily: AppFonts.ibmPlexSansArabic,
    ),
    h2: TextStyle(
      fontSize: 22,
      height: 1.55,
      fontWeight: FontWeight.w500,
      color: AppColorScheme.dark.background,
      fontFamily: AppFonts.ibmPlexSansArabic,
    ),
    title: TextStyle(
      fontSize: 19,
      height: 1.58,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.dark.background,
      fontFamily: AppFonts.ibmPlexSansArabic,
    ),
    subtitle: TextStyle(
      fontSize: 16,
      height: 1.5,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.dark.background,
      fontFamily: AppFonts.ibmPlexSansArabic,
    ),
    caption: TextStyle(
      fontSize: 10,
      height: 1.6,
      fontWeight: FontWeight.normal,
      color: AppColorScheme.dark.background,
      fontFamily: AppFonts.ibmPlexSansArabic,
    ),
    buttons: TextStyle(
      fontSize: 12,
      height: 1.42,
      fontWeight: FontWeight.w500,
      color: AppColorScheme.dark.background,
      fontFamily: AppFonts.ibmPlexSansArabic,
    ),
    small: TextStyle(
      fontSize: 12,
      height: 1.5,
      fontWeight: FontWeight.normal,
      color: AppColorScheme.dark.background,
      fontFamily: AppFonts.ibmPlexSansArabic,
    ),
  );
}
