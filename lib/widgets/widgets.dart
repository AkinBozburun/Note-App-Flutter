import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_notes_app/style/app_styles.dart';

SystemUiOverlayStyle tranparentStatusBar() => const SystemUiOverlayStyle
(
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.dark,
);

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

Widget noteCards(Function() tap,QueryDocumentSnapshot doc) => InkWell
(
  onTap: tap,
  child: Card
  (
    color: AppStyle.colors[doc['note_color']],
    shape: RoundedRectangleBorder
    (
      borderRadius: BorderRadius.circular(10),
    ),
    child: ListTile
    (
      contentPadding: const EdgeInsets.all(14),
      title: Text(doc["note_title"]),
      subtitle: Text(doc["note"]),
    ),
  ),
);

Widget addNoteButton(Function() navigator) => FloatingActionButton
(
  backgroundColor: Colors.blueGrey,
  shape: RoundedRectangleBorder
  (
    borderRadius: BorderRadius.circular(15),
  ),
  onPressed: navigator,
  child: const Icon(Icons.add),
);

Widget backButton(Function() press) => IconButton
(
  onPressed: press,
  icon: const Icon(Icons.keyboard_arrow_left_outlined,color: Colors.black),
);

Widget noteColor(fireStore) => StreamBuilder<DocumentSnapshot>
(
  stream: fireStore.snapshots(),
  builder:(context, AsyncSnapshot<DocumentSnapshot> snapshot)
  {
    if(snapshot.data?.exists ?? snapshot.hasData)
    {
      return AnimatedContainer
      (
        duration: const Duration(milliseconds: 100),
        color: AppStyle.colors[snapshot.data?["note_color"]]
      );
    }
    return const Center();
  },
);