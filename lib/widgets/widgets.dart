import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_notes_app/widgets/colors_list.dart';

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

Widget noteCards(Function() tap,QueryDocumentSnapshot doc)
{
  return InkWell
  (
    onTap: tap,
    child: Card
    (
      color: colors[doc['note_color']],
      elevation: 5,
      shape: RoundedRectangleBorder
      (
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(width: 0.3,color: Colors.grey)
      ),
      child: ListTile
      (
        title: Text(doc["note_title"]),
        subtitle: Text(doc["note"]),
      ),
    ),
  );
}

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