import 'package:flutter/material.dart';

void showMessage(String? message, BuildContext? context) {
  if (context == null) return;
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message ?? ''),
    ),
  );
}
