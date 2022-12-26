import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_notes_app/style/app_styles.dart';

class ColorListWidget extends StatefulWidget
{
  const ColorListWidget({super.key, required this.doc});

  final QueryDocumentSnapshot? doc;

  @override
  State<ColorListWidget> createState() => _ColorListWidgetState();
}

class _ColorListWidgetState extends State<ColorListWidget>
{
  @override
  Widget build(BuildContext context) =>SizedBox
  (
    height: 30,
    child: ListView.builder
    (
      itemCount: AppStyle.colors.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => GestureDetector
      (
        onTap: ()
        {
          final docNote = FirebaseFirestore.instance.collection("notes").doc(widget.doc!.id);
          docNote.update
          ({
              "note_color": index
          }).catchError((onError)=> print(onError));
        },
        child: Container
        (
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: 40,
          decoration: BoxDecoration
          (
            color: AppStyle.colors[index],
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.black,width: 0.1)
          ),
        ),
      ),
    ),
  );
}