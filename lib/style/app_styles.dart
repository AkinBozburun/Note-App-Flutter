import 'package:flutter/material.dart';

class AppStyle
{
  static TextStyle loginTitleStyle = const TextStyle(color: Colors.black,fontSize: 30);

  static OutlineInputBorder txtFieldBorder = OutlineInputBorder
  (
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color: Colors.grey.shade400),
  );

  static TextStyle singUpTxt = const TextStyle(color: Colors.blue,decoration: TextDecoration.underline);

  static TextStyle hiStyle = TextStyle(color: Colors.grey.shade600,fontSize: 16);
  static TextStyle userNameStyle = const TextStyle(color: Colors.black,fontSize: 20);

  static Color noteColor = Colors.yellow.shade200;
  static const Color backgroundColor =  Colors.white;

  static TextStyle titleStyle = const TextStyle(fontSize: 24,fontWeight: FontWeight.w500);
  static TextStyle noteStyle = const TextStyle(fontSize: 18);
  static TextStyle dateStyle = const TextStyle(fontSize: 14,color: Colors.black);


  static List colors =
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