// ignore_for_file: file_names, must_be_immutable

import 'package:dsa_coach/const/data.dart';
import 'package:dsa_coach/pages/TopicView.dart';
import 'package:flutter/material.dart';

class TopicCard extends StatelessWidget {
  final int idx;

  const TopicCard({required this.idx, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TopicView(
              idx: idx,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data[idx]["title"],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(data[idx]["category"]),
              ],
            ),
            Image.asset(
              data[idx]["img"],
              height: 100,
              width: 150,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
