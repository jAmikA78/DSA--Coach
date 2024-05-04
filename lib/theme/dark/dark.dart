import 'package:dsa_coach/theme/widgets/AppBar.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Colors.white,
      secondary: Color.fromARGB(255, 90, 75, 80),
      surface: Color(0xFF616161),
      background: Color(0xFF212121),
      error: Color(0xFFB00020),
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onSurface: Colors.white,
      onBackground: Colors.white,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: appBarTheme(context),
    useMaterial3: true,
  );
}
