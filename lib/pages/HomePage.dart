// ignore_for_file: file_names, non_constant_identifier_names, prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:dsa_coach/pages/AddTopic.dart';
import 'package:dsa_coach/pages/Setting.dart';
import 'package:dsa_coach/pages/Statictics.dart';
import 'package:dsa_coach/pages/TopicsListPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSA  Coach'),
      ),
      body: TopicsList(),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        // type: ExpandableFabType.up,
        distance: 100,
        overlayStyle: ExpandableFabOverlayStyle(
          blur: 5,
        ),
        children: [
          FloatingActionButton(
            heroTag: null,
            child: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingPage()));
            },
          ),
          FloatingActionButton(
            heroTag: null,
            child: const Icon(Icons.data_exploration),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Statictics()));
            },
          ),
          FloatingActionButton(
            heroTag: null,
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddTopic()));
            },
          ),
        ],
      ),
    );
  }
}
