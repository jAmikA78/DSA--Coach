// ignore_for_file: must_be_immutable, file_names

import 'package:dsa_coach/const/data.dart';
import 'package:flutter/material.dart';

class SplitByContainer extends StatelessWidget {
  String text;
  SplitByContainer({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSz + 10,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ),
      ],
    );
  }
}
