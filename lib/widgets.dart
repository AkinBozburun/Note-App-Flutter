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
  child: ListTile
  (
    title: Text("Note #${index+1}"),
    subtitle: Text("This is the note of ${index+1}"),
  ),
);