import 'package:dsa_coach/const/data.dart';
import 'package:dsa_coach/pages/HomePage.dart';
// import 'package:dsa_coach/theme/dark/dark.dart';
// import 'package:dsa_coach/theme/light/light.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      themes: [
        AppTheme.light(),
        AppTheme.dark(),
      ],
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeProvider.themeOf(themeContext).data,
            title: 'DSA Coach',
            home: HomePage(),
          ),
        ),
      ),
    );
  }
}
