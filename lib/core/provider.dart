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
        notifyListeners();
      }
      if(txt == doc?["note"])
      {
        undoColor = Colors.black12;
        notifyListeners();
      }
    }
  }
  undoDeactiveColor()
  {
    undoColor = Colors.black12;
    notifyListeners();
  }


  redoActiveColor(txt1,txt2)
  {
    if(txt1 != txt2)
    {
      print("oky");
      undoColor = Colors.black;
      notifyListeners();
    }
    if(txt1 == txt2)
    {
      undoColor = Colors.black12;
      notifyListeners();
    }
  }
}