import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppColorScheme {
  static final AppColors light = AppColors(
    primary: const Color(0xFF0A3D3A),
    secondary: const Color(0xFF6A161C),
    secondaryBackground: Colors.white,
    background: const Color(0xFFF8FAFF),
    destructive: const Color(0xFFFF357B),
    errorBg: const Color(0xFFFFF0F0),
    errorBorder: const Color(0xFFFFE0E1),
    successText: const Color(0xFF008A2E),
    successBg: const Color(0xFFECFDF2),
    successBorder: const Color(0xFFD3FDE5),
    infoBg: const Color(0xFFF0F8FF),
    infoBorder: const Color(0xFFD3E0FD),
    infoText: const Color(0xFF0973DC),
    warningBg: const Color(0xFFFFFCF0),
    warningBorder: const Color(0xFFFDF5D3),
    warningText: const Color(0xFFDC7609),
    selectedCard: const Color(0xFFE6EBEB),
    peach: const Color(0xFFA85530),
    brown: const Color(0xFF442727),
    gold: const Color(0xFFEAB115),
  );

  static final AppColors dark = AppColors(
    primary: const Color(0xFF7B57FC),
    secondary: const Color(0xFF0F151E),
    secondaryBackground: const Color(0xFFF8FAFC),
    background: const Color(0xFF001B36),
    destructive: const Color(0xFFFF357B),
    errorBg: const Color(0xFFFFF0F0),
    errorBorder: const Color(0xFFFFE0E1),
    successText: const Color(0xFF008A2E),
    successBg: const Color(0xFFECFDF2),
    successBorder: const Color(0xFFD3FDE5),
    infoBg: const Color(0xFFF0F8FF),
    infoBorder: const Color(0xFFD3E0FD),
    infoText: const Color(0xFF0973DC),
    warningBg: const Color(0xFFFFFCF0),
    warningBorder: const Color(0xFFFDF5D3),
    warningText: const Color(0xFFDC7609),
    selectedCard: const Color(0xFFE6EBEB),
    peach: const Color(0xFFA85530),
    brown: const Color(0xFF442727),
    gold: const Color(0xFFEAB115),
  );
}
