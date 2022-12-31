import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_notes_app/core/provider.dart';
import 'package:my_notes_app/style/app_styles.dart';
import 'package:my_notes_app/widgets/color_list_build.dart';
import 'package:provider/provider.dart';

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

Widget undoButton(Function() undo,con)
{
  final prov = Provider.of<NoteProvider>(con);

  return IconButton
  (
    onPressed: undo,
    icon: const Icon(Icons.undo_outlined),color: prov.color
  );
}

Widget redoButton()
{
  return IconButton
  (
    onPressed: (){},
    icon: const Icon(Icons.redo_outlined),
    color: Colors.black12
  );
}

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

Widget colorsBar(doc,id)
{
  if(doc?["note_date"] == null)
  {
    return Container
    (
      height: 50,
      color: Colors.black12,
      child: Column(mainAxisAlignment: MainAxisAlignment.center,children:[ColorListWidget(id: id)],
      )
    );
  }
  return Container //Color list
  (
    color: Colors.black12,
    height: 85,
    child: Column
    (
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        Text("Düzenlenme tarihi: ${doc?["note_date"]}",style: AppStyle.dateStyle),
        const SizedBox(height: 10),
        ColorListWidget(id: id!),
      ],
    ),
  );
}