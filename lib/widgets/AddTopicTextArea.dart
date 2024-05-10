// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:text_area/text_area.dart';

class AddTopicTextArea extends StatefulWidget {
  var myController;
  String labelText;
  var myValidation;
  AddTopicTextArea(
      {required this.myValidation,
      required this.myController,
      required this.labelText,
      super.key});

  @override
  State<AddTopicTextArea> createState() => _AddTopicTextAreaState();
}

class _AddTopicTextAreaState extends State<AddTopicTextArea> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(widget.labelText),
        TextArea(
          borderRadius: 10,
          borderColor: Colors.transparent,
          textEditingController: widget.myController,
          suffixIcon: Icons.attach_file_rounded,
          onSuffixIconPressed: () => {},
          validation: widget.myValidation,
          errorText: 'Please type a ${widget.labelText}!',
        ),
      ],
    );
  }
}
