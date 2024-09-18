import 'package:flutter/material.dart';

ElevatedButton mainButton(
    {String buttonText = '',
    Color buttonColor = Colors.blueGrey,
    double horizontalPadding = 60,
    double verticalPadding = 20,
    double fontSize = 20,
    Function()? buttonFunction}) {
  return ElevatedButton(
    onPressed: buttonFunction,
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ))),
    child: Text(
      buttonText,
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.white,
      ),
    ),
  );
}