// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

import 'package:dsa_coach/const/data.dart';
import 'package:flutter/material.dart';

class Statictics extends StatefulWidget {
  const Statictics({super.key});

  @override
  State<Statictics> createState() => _StaticticsState();
}

class _StaticticsState extends State<Statictics> {
  int avergeSolve = 0;
  int avergeThink = 0;
  int calcThinkingAverage() {
    int _mins = 0;
    for (int i = 0; i < problemsTimes.length; i++) {
      _mins += problemsTimes[i].values.first.values.first.inMinutes;
    }
    if (problemsTimes.isEmpty) return 0;
    _mins = _mins ~/ problemsTimes.length;
    return _mins;
  }

  int calcSolvingAverage() {
    int _mins = 0;
    for (int i = 0; i < problemsTimes.length; i++) {
      _mins += problemsTimes[i].values.first.values.last.inMinutes;
    }
    if (problemsTimes.isEmpty) return 0;
    _mins = _mins ~/ problemsTimes.length;
    return _mins;
  }

  @override
  Widget build(BuildContext context) {
    avergeSolve = calcSolvingAverage();
    avergeThink = calcThinkingAverage();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Statistics'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Statistics",
                style: TextStyle(
                  fontSize: fontSz + 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${problemsTimes.length} Problems solved",
                style: TextStyle(
                  fontSize: fontSz - 5,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Average Thinking Time: $avergeThink mins",
                style: TextStyle(
                  fontSize: fontSz - 5,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Average Solving Time: $avergeSolve mins",
                style: TextStyle(
                  fontSize: fontSz - 5,
                ),
              ),
            ),
          ],
        ));
  }
}
