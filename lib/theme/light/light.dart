import 'package:dsa_coach/theme/widgets/AppBar.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      secondary: Color.fromARGB(255, 238, 141, 173),
      surface: Color(0xFFE0E0E0),
      background: Color(0xFFFFFFFF),
      error: Color(0xFFB00020),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 128, 128, 128),
    appBarTheme: appBarTheme(context),
    useMaterial3: true,
  );
}
