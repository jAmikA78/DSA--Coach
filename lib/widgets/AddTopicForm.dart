// ignore_for_file: file_names

import 'package:dsa_coach/const/data.dart';
import 'package:dsa_coach/widgets/AddTopicTextArea.dart';
import 'package:dsa_coach/widgets/AddTopicTextField.dart';
import 'package:dsa_coach/widgets/SplitByContainer.dart';
import 'package:flutter/material.dart';

class AddTopicForm extends StatefulWidget {
  const AddTopicForm({super.key});

  @override
  State<AddTopicForm> createState() => _AddTopicFormState();
}

class _AddTopicFormState extends State<AddTopicForm> {
  final _formKey = GlobalKey<FormState>();
  var descriptionValidation = true;
  var tutorialValidation = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // controllars for all text fields
  final titleController = TextEditingController();
  final imgController = TextEditingController();
  final categoryController = TextEditingController();
  final descriptionController = TextEditingController();
  final ytTitleController = TextEditingController();
  final ytAuthController = TextEditingController();
  final ytLinkController = TextEditingController();
  final problemTitleController = TextEditingController();
  final problemLinkController = TextEditingController();
  final problemTutorialController = TextEditingController();
  final tutorialController = TextEditingController();

  @override
  void initState() {
    super.initState();
    descriptionController.addListener(() {
      setState(() {
        descriptionValidation = descriptionController.text.isEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          SplitByContainer(text: 'Topic Info'),
          AddTopicTextField(
              myController: titleController, labelText: "Topic Title"),
          const SizedBox(height: 20),
          AddTopicTextField(
              myController: imgController, labelText: "Image URL"),
          const SizedBox(height: 20),
          AddTopicTextField(
              myController: categoryController, labelText: "Topic Category"),
          const SizedBox(height: 20),
          AddTopicTextArea(
            myController: descriptionController,
            labelText: "Topic Description",
            myValidation: descriptionValidation,
          ),
          SplitByContainer(text: 'videos Info'),
          AddTopicTextField(
              myController: ytTitleController, labelText: "Youtube Title"),
          const SizedBox(height: 20),
          AddTopicTextField(
              myController: ytAuthController, labelText: "Youtube Auther"),
          const SizedBox(height: 20),
          AddTopicTextField(
              myController: ytLinkController, labelText: "Youtube Link"),
          SplitByContainer(text: 'Problems Info'),
          AddTopicTextField(
              myController: problemTitleController, labelText: "Problem Title"),
          const SizedBox(height: 20),
          AddTopicTextField(
              myController: problemLinkController, labelText: "Problem Link"),
          const SizedBox(height: 20),
          AddTopicTextArea(
              myValidation: tutorialValidation,
              myController: tutorialController,
              labelText: 'Problem Toutorial'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                topicTemp["title"] = titleController.text;
                topicTemp["img"] = imgController.text;
                topicTemp["category"] = categoryController.text;
                topicTemp["description"] =
                    descriptionController.text.split('\n');
                topicTemp["yt"] = [
                  {
                    "title": ytTitleController.text,
                    "author": ytAuthController.text,
                    "link": ytLinkController.text
                  }
                ];
                topicTemp["problems"] = [
                  {
                    "title": problemTitleController.text,
                    "link": problemLinkController.text,
                    "tutorial": tutorialController.text,
                    "solved": 0
                  }
                ];
                data.add(topicTemp);
                saveData();

                Navigator.pop(context);
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
