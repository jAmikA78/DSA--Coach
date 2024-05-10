import 'dart:convert';

import 'package:flutter/services.dart';

double fontSz = 25.0;
List<Map<int, Map<Duration, Duration>>> problemsTimes = [];

List data = [];
Future<void> loadData() async {
  try {
    var response = await rootBundle.loadString("assets/JSON/data.json");
    final temp = json.decode(response);
    data = temp;
  } catch (error) {
    print('Error: $error');
  }
}
