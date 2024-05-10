// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';

class AddTopicTextField extends StatefulWidget {
  var myController;
  String labelText;

  AddTopicTextField(
      {required this.myController, required this.labelText, super.key});

  @override
  State<AddTopicTextField> createState() => _AddTopicTextFieldState();
}

class _AddTopicTextFieldState extends State<AddTopicTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.myController,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: widget.labelText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter ${widget.labelText}';
        }
        return null;
      },
    );
  }
}
