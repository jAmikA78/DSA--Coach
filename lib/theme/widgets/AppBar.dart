// ignore_for_file: file_names

import 'package:flutter/material.dart';

AppBarTheme appBarTheme(BuildContext context) {
  return AppBarTheme(
    iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
    centerTitle: true,
    elevation: 0,
  );
}
