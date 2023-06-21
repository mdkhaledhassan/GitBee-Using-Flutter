import 'package:flutter/material.dart';

class ThemeClass {
  // light Theme
  ThemeData lightThemeData(BuildContext context) {
    return ThemeData.light().copyWith(
      appBarTheme: AppBarTheme(
          color: Colors.white,
          actionsIconTheme: IconThemeData(color: Colors.black),
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black)),
      primaryColor: Colors.black,
    );
  }

// dark Theme
  ThemeData darkThemeData(BuildContext context) {
    return ThemeData.dark().copyWith(
        primaryColor: Color(0xFFFF1D00),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF24A751)));
  }
}
