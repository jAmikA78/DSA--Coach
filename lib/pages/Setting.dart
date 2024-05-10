// ignore_for_file: file_names

import 'package:dsa_coach/const/data.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          Slider(
            value: fontSz,
            max: 40.0,
            min: 10.0,
            divisions: 5,
            label: fontSz.round().toString(),
            onChanged: (double value) {
              setState(() {
                fontSz = value;
              });
            },
          ),
          Text('Font Size: ${fontSz.toInt()}',
              style: TextStyle(fontSize: fontSz)),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              ThemeProvider.controllerOf(context).nextTheme();
            },
            child: Text(
              "Change Theme",
              style: TextStyle(fontSize: fontSz),
            ),
          ),
        ],
      ),
    );
  }
}
