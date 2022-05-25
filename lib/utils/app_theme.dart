import 'package:flutter/material.dart';
import 'package:needbox_sr/utils/colors.dart';

class AppTheme {
  static final appTheme = ThemeData(
    scaffoldBackgroundColor: white,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 30,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    ),
  );
}
