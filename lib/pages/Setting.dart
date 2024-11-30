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
      body: ListView(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.settings,
                size: 200,
              ),
            ],
          ),
          Text(
            'Font Size: ${fontSz.toInt()}',
            style: const TextStyle(fontSize: 30),
          ),
          const SizedBox(height: 10),
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                ThemeProvider.controllerOf(context).nextTheme();
              },
              child: const Text(
                "Change Theme",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'It is an your own Coach.\nThe main target of our project is helping you to improve your programming skills  by help you learning new programming topics in Data Structure and Algorithems (DSA).',
              style: TextStyle(fontSize: fontSz),
            ),
          )
        ],
      ),
    );
  }
}
