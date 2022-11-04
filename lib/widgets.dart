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

Widget noteCard(int index,Color noteColor) => Card
(
  color: noteColor,
  elevation: 5,
  shape: RoundedRectangleBorder
  (
    borderRadius: BorderRadius.circular(10),
    side: const BorderSide(width: 0.3,color: Colors.grey)
  ),
  child: ListTile
  (
    title: Text("Note #${index+1}",style: const TextStyle(fontWeight: FontWeight.bold)),
    subtitle: Text("This is the note ${index+1}"),
  ),
);

Widget addNoteButton() => FloatingActionButton
(
  shape: RoundedRectangleBorder
  (
    borderRadius: BorderRadius.circular(10),
  ),
  onPressed: () => print("eklendi."),
  child: const Icon(Icons.add),
);