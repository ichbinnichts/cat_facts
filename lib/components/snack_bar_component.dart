import 'package:flutter/material.dart';

SnackBar snackBar({String message = '', Color? color}) {
  return SnackBar(
    content: Text(message),
    backgroundColor: color,
  );
}
