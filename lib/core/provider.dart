import 'package:flutter/material.dart';

class NoteProvider extends ChangeNotifier
{
  late Color undoColor;
  late Color redoColor;

  initializeColor()
  {
    undoColor = Colors.black12;
    redoColor = Colors.black12;
  }

  undoActiveColor(txt, doc)
  {
    if(doc?["note"] != null)
    {
      if(txt != doc?["note"])
      {
        print("oky");
        undoColor = Colors.black;
        redoColor = Colors.black12;
        notifyListeners();
      }
      if(txt == doc?["note"])
      {
        print("not oky");
        undoColor = Colors.black12;
        redoColor = Colors.black;
        notifyListeners();
      }
    }
  }

  redoActiveColor(txt1,doc)
  {
    if(txt1 != doc?["note"])
      {
        print("oky");
        undoColor = Colors.black12;
        notifyListeners();
      }
      if(txt1 == doc?["note"])
      {
        undoColor = Colors.black;
        notifyListeners();
      }
  }
}