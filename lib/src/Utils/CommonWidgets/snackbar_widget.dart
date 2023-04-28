import 'package:flutter/material.dart';

void showSnackBar(String text, BuildContext context) {
  var snackBar = SnackBar(
    content: Text(text),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
