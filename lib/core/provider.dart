import 'package:flutter/material.dart';

class NoteProviders extends ChangeNotifier
{
  int colorIndex = 6;
  changeColor(i,)
  {
    colorIndex = i;
    notifyListeners();
  }
}