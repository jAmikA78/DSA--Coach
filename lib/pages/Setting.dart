// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ThemeProvider.controllerOf(context).nextTheme();
      },
      child: const Text("Change Theme"),
    );
  }
}
