import 'package:flutter/cupertino.dart';

class Providers extends ChangeNotifier
{
  int index = 0;
  changeColor(i)
  {
    index = i;
    notifyListeners();
  }
}