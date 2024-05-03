import 'package:dsa_coach/theme/widgets/AppBar.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Colors.white,
      primaryContainer: Color.fromARGB(186, 0, 0, 0),
      onPrimaryContainer: Color.fromARGB(255, 170, 203, 238),
      secondary: Colors.grey,
      background: Colors.black,
      onBackground: Colors.white,
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onSurface: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: appBarTheme(context),
    useMaterial3: true,
  );
}
