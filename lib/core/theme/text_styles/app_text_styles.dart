import 'package:flutter/material.dart';

class AppTextStyles extends ThemeExtension<AppTextStyles> {
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle title;
  final TextStyle subtitle;


  final TextStyle caption;
  final TextStyle buttons;

  final TextStyle small;

  AppTextStyles({
    required this.h1,
    required this.h2,
    required this.title,
    required this.subtitle,

    required this.caption,
    required this.buttons,
    required this.small,
  });
  @override
  ThemeExtension<AppTextStyles> copyWith() {
    throw UnimplementedError();
  }

  @override
  ThemeExtension<AppTextStyles> lerp(
    covariant ThemeExtension<AppTextStyles>? other,
    double t,
  ) {
    if (other is! AppTextStyles) {
      return this;
    }
    return AppTextStyles(
      h1: TextStyle.lerp(h1, other.h1, t)!,
      h2: TextStyle.lerp(h2, other.h2, t)!,
      title: TextStyle.lerp(title, other.title, t)!,
      subtitle: TextStyle.lerp(subtitle, other.subtitle, t)!,
      caption: TextStyle.lerp(caption, other.caption, t)!,
      buttons: TextStyle.lerp(buttons, other.buttons, t)!,
      small: TextStyle.lerp(small, other.small, t)!,
    );
  }
}
