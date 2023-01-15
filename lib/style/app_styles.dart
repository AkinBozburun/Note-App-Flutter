import 'package:flutter/material.dart';

class AppStyle
{
  static TextStyle loginTitleStyle = const TextStyle(color: Colors.black,fontSize: 30);

  static OutlineInputBorder txtFieldBorder = const OutlineInputBorder
  (
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color: backgroundColor),
  );

  static TextStyle singUpTxt = const TextStyle(color: Colors.blue,decoration: TextDecoration.underline);

  static TextStyle hiStyle = TextStyle(color: Colors.grey.shade600,fontSize: 16);
  static TextStyle userNameStyle = const TextStyle(color: Colors.black,fontSize: 20);

  static TextStyle titleStyle = const TextStyle(fontSize: 24,fontWeight: FontWeight.w500);
  static TextStyle noteStyle = const TextStyle(fontSize: 18);
  static TextStyle dateStyle = const TextStyle(fontSize: 14,color: Colors.black);

  static const Color backgroundColor =  Color(0xFFE9E9E9);
  static const Color blueColor = Color(0xFF85B6B1);
  static const Color blackColor = Color(0xFF0A0909);
  static const Color orangeColor = Color(0xFFED7A3C);

  static List colorsBar =
  [
    Colors.red.shade200,
    Colors.orange.shade200,
    Colors.yellow.shade200,
    Colors.green.shade200,
    Colors.blue.shade200,
    Colors.purple.shade200,
    Colors.grey.shade200,
    Colors.brown.shade400,
  ];
}