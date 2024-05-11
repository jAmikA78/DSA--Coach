// ignore_for_file: must_be_immutable, file_names

import 'package:dsa_coach/const/data.dart';
import 'package:flutter/material.dart';

class StaticticsCard extends StatelessWidget {
  String title;
  int value;
  StaticticsCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value.toString(),
            style:
                TextStyle(fontSize: fontSz + 10, fontWeight: FontWeight.bold),
          ),
          Text(
            title,
            style: TextStyle(fontSize: fontSz - 5),
          ),
        ],
      ),
    );
  }
}
