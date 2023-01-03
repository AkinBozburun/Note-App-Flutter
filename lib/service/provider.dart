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

  undoRedoColorChange(txt, doc)
  {
    if(doc?["note"] != null)
    {
      if(txt != doc?["note"])
      {
        undoColor = Colors.black;
        redoColor = Colors.black12;
        notifyListeners();
      }
      if(txt == doc?["note"])
      {
        undoColor = Colors.black12;
        redoColor = Colors.black;
        notifyListeners();
      }
    }
  }
}