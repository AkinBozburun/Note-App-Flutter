import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_notes_app/style/app_styles.dart';

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

Widget backButton(Function() press) => IconButton
(
  onPressed: press,
  icon: const Icon(Icons.keyboard_arrow_left_outlined,color: Colors.black),
);

Widget noteCards(Function() tap,QueryDocumentSnapshot doc)
{
  return InkWell
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
}

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

Widget colorList(Function()? tap) => SizedBox
(
  height: 40,
  child: ListView.builder
  (
    itemCount: AppStyle.colors.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) => GestureDetector
    (
      onTap: tap,
      child: Container
      (
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: 40,
        decoration: BoxDecoration
        (
          shape: BoxShape.circle,
          color: AppStyle.colors[index],
          border: Border.all(color: Colors.black,width: 0.1)
        ),
      ),
    ),
  ),
);


SystemUiOverlayStyle tranparentStatusBar() => const SystemUiOverlayStyle
(
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.dark,
);