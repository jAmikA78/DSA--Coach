import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

double fontSz = 25.0;

class solvedProblemData {
  late int wrongs;
  late Duration solveTime;
  late Duration thinkTime;

  solvedProblemData(this.wrongs, this.solveTime, this.thinkTime);
}

List<solvedProblemData> problemsTimes = [];

List data = [];
Future<void> loadData() async {
  try {
    var response = await rootBundle.loadString("assets/JSON/data.json");
    final temp = json.decode(response);
    data = temp;
  } catch (error) {
    debugPrint('Error: $error');
  }
}

Future<void> saveData() async {
  try {
    String jsonString = jsonEncode(data);

    File('assets/JSON/data.json').writeAsStringSync(jsonString);

    debugPrint('JSON file created successfully.');
  } catch (error) {
    debugPrint('Error: $error');
  }
}

var topicTemp = {
  "title": "",
  "img": "",
  "category": "",
  "description": [""],
  "yt": [
    {"title": "", "author": "", "link": ""}
  ],
  "done": 0,
  "local": 0,
  "total": 0,
  "problems": [
    {
      "title": "",
      "link": "",
      "tutorial": "",
      "difficulty": 0,
      "solved": 0,
    }
  ]
};
