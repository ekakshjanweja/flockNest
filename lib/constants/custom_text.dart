import 'package:flutter/material.dart';

class CustomTextClass {
  //h1

  static TextStyle h1(BuildContext context, Color textColor) {
    return TextStyle(
      fontSize: MediaQuery.of(context).size.height * 0.05,
      fontWeight: FontWeight.bold,
      color: textColor,
    );
  }

  //h2

  static TextStyle h2(BuildContext context, Color textColor) {
    return TextStyle(
      fontSize: MediaQuery.of(context).size.height * 0.03,
      fontWeight: FontWeight.bold,
      color: textColor,
    );
  }

  //h3

  static TextStyle h3(BuildContext context, Color textColor) {
    return TextStyle(
      fontSize: MediaQuery.of(context).size.height * 0.02,
      fontWeight: FontWeight.bold,
      color: textColor,
    );
  }

  //body text

  static TextStyle bodyText(BuildContext context, Color textColor) {
    return TextStyle(
      fontSize: MediaQuery.of(context).size.height * 0.02,
      fontWeight: FontWeight.normal,
      color: textColor,
    );
  }
}
