// ignore_for_file: file_names

import 'package:dsa_coach/const/data.dart';
import 'package:dsa_coach/widgets/TopicCard.dart';
import 'package:flutter/material.dart';

class TopicsList extends StatelessWidget {
  const TopicsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return TopicCard(idx: index);
      },
    );
  }
}
