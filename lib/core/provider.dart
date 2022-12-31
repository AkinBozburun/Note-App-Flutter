import 'package:flutter/material.dart';

class NoteProvider extends ChangeNotifier
{
  late Color color;

  undoActiveColor(txt, doc)
  {
    if(doc?["note"] != null)
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
  }

  undoInitializeColor()
  {
    color = Colors.black12;
  }

  undoDeactiveColor()
  {
    color = Colors.black12;
    notifyListeners();
  }
}