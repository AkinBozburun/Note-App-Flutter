import 'package:flutter/material.dart';
import 'package:my_notes_app/main.dart';

class Utils
{
  static showSnackBar(String? txt)
  {
    if(txt == null) return;

    final snackBar = SnackBar(content: Text(txt),backgroundColor: Colors.red);

    messengerKey.currentState!..removeCurrentSnackBar()..showSnackBar(snackBar);
  }
}