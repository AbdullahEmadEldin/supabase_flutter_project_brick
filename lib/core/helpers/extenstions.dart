
import 'package:flutter/material.dart';

import '../theme/colors/app_colors.dart';
import '../theme/text_styles/app_text_styles.dart';

extension ThemeExtension on BuildContext {
  // Color Scheme
  AppColors get colorScheme => Theme.of(this).extension<AppColors>()!;
  AppTextStyles get textTheme => Theme.of(this).extension<AppTextStyles>()!;
  // You might also want these common theme accessors:
  ThemeData get theme => Theme.of(this);

  // Brightness
  Brightness get brightness => theme.brightness;
  bool get isDark => brightness == Brightness.dark;
  bool get isLight => brightness == Brightness.light;
}
