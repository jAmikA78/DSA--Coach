// ignore_for_file: file_names, non_constant_identifier_names, prefer_const_constructors, must_be_immutable

import 'package:dsa_coach/pages/Setting.dart';
import 'package:dsa_coach/pages/Statictics.dart';
import 'package:dsa_coach/pages/TopicsListPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _Pages = [
    Statictics(),
    TopicsList(),
    SettingPage(),
  ];

  int _idx = 1;

  List<NavigationDestination> navigationList = [
    NavigationDestination(
      icon: const Icon(Icons.shape_line),
      selectedIcon: const Icon(Icons.shape_line_outlined),
      label: "Statictics",
    ),
    NavigationDestination(
      icon: const Icon(Icons.home_max),
      selectedIcon: const Icon(Icons.home_max_outlined),
      label: "Topics",
    ),
    NavigationDestination(
      icon: const Icon(Icons.settings),
      selectedIcon: const Icon(Icons.settings_outlined),
      label: "Settings",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSA  Coach'),
      ),
      body: _Pages[_idx],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _idx,
        onDestinationSelected: (index) => setState(() => _idx = index),
        destinations: navigationList,
      ),
    );
  }
}
