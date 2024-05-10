// ignore_for_file: must_be_immutable, file_names, deprecated_member_use

import 'package:dsa_coach/const/data.dart';
import 'package:dsa_coach/pages/SolvingView.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProblemWidget extends StatefulWidget {
  final String title;
  final String link;
  final String tutorial;
  int solved;

  ProblemWidget(
      {super.key,
      required this.title,
      required this.link,
      required this.tutorial,
      required this.solved});

  @override
  State<ProblemWidget> createState() => _ProblemWidgetState();
}

class _ProblemWidgetState extends State<ProblemWidget> {
  void _launchURL() async {
    if (await canLaunch(widget.link)) {
      await launch(widget.link);
    } else {
      throw 'Could not launch $widget.link';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: fontSz,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  _launchURL();
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).colorScheme.primary),
                  child: Text(
                    "Link",
                    style: TextStyle(
                        fontSize: fontSz - 5,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SolvingView(
                                title: widget.title,
                                tutorial: widget.tutorial,
                              )));
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).colorScheme.primary),
                  child: Text(
                    "Start Solving",
                    style: TextStyle(
                        fontSize: fontSz - 5,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
