// ignore_for_file: file_names

import 'package:dsa_coach/widgets/AddTopicForm.dart';
import 'package:flutter/material.dart';

class AddTopic extends StatelessWidget {
  const AddTopic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Topic'),
      ),
      body: const AddTopicForm(),
    );
  }
}
