import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

Widget noteCard(int index,Color noteColor,List note) => Card
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
    title: Text(note[index]["title"],style: const TextStyle(fontWeight: FontWeight.bold)),
    subtitle: Text(note[index]["note"]),
  ),
);

Widget addNoteButton() => FloatingActionButton
(
  backgroundColor: Colors.blueGrey,
  shape: RoundedRectangleBorder
  (
    borderRadius: BorderRadius.circular(15),
  ),
  onPressed: () => print("eklendi."),
  child: const Icon(Icons.add),
);

SystemUiOverlayStyle tranparentStatusBar() => const SystemUiOverlayStyle
(
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.dark,
);