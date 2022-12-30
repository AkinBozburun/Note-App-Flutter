import 'package:flutter/material.dart';

class NoteProvider extends ChangeNotifier
{
  Color color = Colors.grey;

  undoActiveColor(txt, doc)
  {
    if(txt != doc?["note"])
    {
      print("oky");
      color = Colors.black;
      notifyListeners();

    }
    if(txt == doc?["note"])
    {
      color = Colors.grey;
      notifyListeners();
    }
  }

  undoDeactiveColor()
  {
    color = Colors.black12;
  }
}