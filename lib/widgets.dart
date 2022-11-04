import 'package:flutter/material.dart';

Widget avatar() => GestureDetector
(
  onTap: () => print("auth"),
  child: const CircleAvatar
  (
    radius: 24,
    backgroundColor: Colors.blueGrey,
    child: Text("A"),
  ),
);

Widget noteCard(int index) => Card
(
  color: Colors.yellow.shade100,
  elevation: 5,
  shape: RoundedRectangleBorder
  (
    borderRadius: BorderRadius.circular(10),
    side: const BorderSide(width: 0.5,color: Colors.black26)
  ),
  child: ListTile
  (
    title: Text("Note #${index+1}"),
    subtitle: Text("This is the note of ${index+1}"),
  ),
);