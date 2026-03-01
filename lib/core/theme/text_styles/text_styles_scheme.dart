import 'package:flutter/material.dart';

import '../colors/app_color_scheme.dart';
import 'app_text_styles.dart';

class AppFonts {

  static const String ipmPlexSansAr = 'IPMPlexSansArabic-Regular';
}

// Regular: FontWeight.normal or FontWeight.w400
// Medium: FontWeight.w500
// SemiBold: FontWeight.w600
abstract class AppTextStylesScheme {
  static AppTextStyles light = AppTextStyles(
    h1: TextStyle(
      fontSize: 36,
      height: 1.29, // 36/28 = 1.29
      fontWeight: FontWeight.w600,
      color: AppColorScheme.light.background,
      fontFamily: AppFonts.ipmPlexSansAr,
    ),
    h2: TextStyle(
      fontSize: 20,
      height: 1.55, // 34/22 = 1.55
      fontWeight: FontWeight.w500,
      color: AppColorScheme.light.background,
      fontFamily: AppFonts.ipmPlexSansAr,
    ),
    title: TextStyle(
      fontSize: 16,
      height: 1.58, // 30/19 = 1.58
      fontWeight: FontWeight.w500,
      color: AppColorScheme.light.background,
      fontFamily: AppFonts.ipmPlexSansAr,
    ),
    subtitle: TextStyle(
      fontSize: 14,
      height: 1.5, // 24/16 = 1.5
      fontWeight: FontWeight.normal,
      color: AppColorScheme.light.background,
      fontFamily: AppFonts.ipmPlexSansAr,
    ),

    caption: TextStyle(
      fontSize: 10,
      height: 1.6, // 16/10 = 1.6
      fontWeight: FontWeight.normal,
      color: AppColorScheme.light.background,
      fontFamily: AppFonts.ipmPlexSansAr,
    ),
    buttons: TextStyle(
      fontSize: 12,
      height: 1.42, // 17/12 = 1.42
      fontWeight: FontWeight.w500,
      color: AppColorScheme.light.background,
      fontFamily: AppFonts.ipmPlexSansAr,
    ),
   
   
   
    small: TextStyle(
      fontSize: 12,
      height: 1.5, // 18/12 = 1.5
      fontWeight: FontWeight.normal,
      color: AppColorScheme.light.background,
      fontFamily: AppFonts.ipmPlexSansAr,
    ),
  );

  static AppTextStyles dark = AppTextStyles(
    h1: TextStyle(
      fontSize: 28,
      height: 1.29,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.dark.background,
      fontFamily: AppFonts.ipmPlexSansAr,
    ),
    h2: TextStyle(
      fontSize: 22,
      height: 1.55,
      fontWeight: FontWeight.w500,
      color: AppColorScheme.dark.background,
      fontFamily: AppFonts.ipmPlexSansAr,
    ),
    title: TextStyle(
      fontSize: 19,
      height: 1.58,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.dark.background,
      fontFamily: AppFonts.ipmPlexSansAr,
    ),
    subtitle: TextStyle(
      fontSize: 16,
      height: 1.5,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.dark.background,
      fontFamily: AppFonts.ipmPlexSansAr,
    ),
    caption: TextStyle(
      fontSize: 10,
      height: 1.6,
      fontWeight: FontWeight.normal,
      color: AppColorScheme.dark.background,
      fontFamily: AppFonts.ipmPlexSansAr,
    ),
    buttons: TextStyle(
      fontSize: 12,
      height: 1.42,
      fontWeight: FontWeight.w500,
      color: AppColorScheme.dark.background,
      fontFamily: AppFonts.ipmPlexSansAr,
    ),
    small: TextStyle(
      fontSize: 12,
      height: 1.5,
      fontWeight: FontWeight.normal,
      color: AppColorScheme.dark.background,
      fontFamily: AppFonts.ipmPlexSansAr,
    ),
  );
}
