import 'package:flutter/material.dart';
import 'package:flutter_custom_theme/flutter_custom_theme.dart';

class CustomTheme extends CustomThemeData {
  static CustomTheme of(BuildContext context) => CustomThemes.safeOf(context,
      mainDefault: const CustomTheme.light(),
      darkDefault: const CustomTheme.dark());

  final Color brand;
  final Color container;
  final Color background;
  final Color primary;
  final Color secondary;
  final Color green;
  final Color orange;
  final Color red;

  const CustomTheme.light(
      {this.brand = const Color(0xFF36479E),
      this.container = const Color(0xFFFFFFFF),
      this.background = const Color(0xFFF6F6F6),
      this.primary = const Color(0xFF17181E),
      this.secondary = const Color(0xFFC4C4CC),
      this.green = const Color(0xFF61D66D),
      this.orange = const Color(0xFFD67661),
      this.red = const Color(0xFFC63D3D)});

  const CustomTheme.dark(
      {this.brand = const Color(0xFF36479E),
      this.container = const Color(0xFF202024),
      this.background = const Color(0xFF121214),
      this.primary = const Color(0xFFFFFFFF),
      this.secondary = const Color(0xFFC4C4CC),
      this.green = const Color(0xFF61D66D),
      this.orange = const Color(0xFFD67661),
      this.red = const Color(0xFFC63D3D)});
}
