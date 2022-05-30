import 'package:flutter/material.dart';

class AppConstants {
  static const Color primaryColor = Color(0xFFFF5722);
  static const Color secondaryColor = Color(0xFFFF9800);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color textColorPrimary = Color(0xFF455A64);

  static const Gradient generalGradient = LinearGradient(
      colors: [Color(0xFFFF5722), Color(0xFFFF9800)],
      begin: FractionalOffset(0.0, 0.0),
      end: FractionalOffset(0.0, 1.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp);

  static const insetSize = 15.0;
}
