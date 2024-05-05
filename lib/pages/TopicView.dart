import 'package:dsa_coach/const/data.dart';
import 'package:dsa_coach/widgets/ProblemWidget.dart';
import 'package:dsa_coach/widgets/YTVideo.dart';
import 'package:flutter/material.dart';

class TopicView extends StatelessWidget {
  final int idx;
  const TopicView({required this.idx, super.key});

  @override
  Widget build(BuildContext context) {
    final descriptions = <Widget>[];
    for (int i = 0; i < data[idx]["description"].length; i++) {
      descriptions.add(Text(
        data[idx]["description"][i] + '\n',
        style: TextStyle(fontSize: fontSz - 5),
      ));
    }
    final yt = <Widget>[];
    for (int i = 0; i < data[idx]["yt"].length; i++) {
      yt.add(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YTVideo(
              videoID: data[idx]["yt"][i]["link"],
              videoAuthor: data[idx]["yt"][i]["author"],
              videoTitle: data[idx]["yt"][i]["title"]),
        ],
      ));
    }
    final problems = <Widget>[];
    for (int i = 0; i < data[idx]["problems"].length; i++) {
      problems.add(ProblemWidget(
          title: data[idx]["problems"][i]["title"],
          link: data[idx]["problems"][i]["link"],
          tutorial: data[idx]["problems"][i]["tutorial"],
          difficulty: data[idx]["problems"][i]["difficulty"],
          solved: data[idx]["problems"][i]["solved"]));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data[idx]["title"],
          style: TextStyle(fontSize: fontSz + 5),
        ),
      ),
      body: ListView(
        children: [
          Image.asset(data[idx]["img"]),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: descriptions,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Text(
                  "Youtube videos",
                  style: TextStyle(
                    fontSize: fontSz + 10,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: yt,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Text(
                  "Topic Problems",
                  style: TextStyle(
                    fontSize: fontSz + 10,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: problems,
          ),
        ],
      ),
    );
  }
}
