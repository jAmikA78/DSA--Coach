// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

import 'package:dsa_coach/const/data.dart';
import 'package:dsa_coach/widgets/SplitByContainer.dart';
import 'package:dsa_coach/widgets/StaticticsCard.dart';
import 'package:flutter/material.dart';

class Statictics extends StatefulWidget {
  const Statictics({super.key});

  @override
  State<Statictics> createState() => _StaticticsState();
}

class _StaticticsState extends State<Statictics> {
  @override
  Widget build(BuildContext context) {
    int avergeSolve = 0;
    int avergeThink = 0;
    int nOfWrongs = 0;
    int nOfSolved = problemsTimes.length;
    for (int i = 0; i < problemsTimes.length; i++) {
      avergeSolve += problemsTimes[i].solveTime.inMinutes;
      avergeThink += problemsTimes[i].thinkTime.inMinutes;
      nOfWrongs += problemsTimes[i].wrongs;
    }
    if (nOfSolved != 0) {
      avergeSolve = avergeSolve ~/ nOfSolved;
      avergeThink = avergeThink ~/ nOfSolved;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SplitByContainer(text: 'Problems data'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StaticticsCard(
                title: 'Problems solved',
                value: nOfSolved,
              ),
              StaticticsCard(
                title: 'Numper of wrongs',
                value: nOfWrongs,
              )
            ],
          ),
          SplitByContainer(text: 'Average Time'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StaticticsCard(
                title: 'Solving Time',
                value: avergeSolve,
              ),
              StaticticsCard(
                title: 'Thinking Time',
                value: avergeThink,
              )
            ],
          ),
        ],
      ),
    );
  }
}
