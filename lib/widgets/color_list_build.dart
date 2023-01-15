import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_notes_app/style/app_styles.dart';

class ColorListWidget extends StatefulWidget
{
  const ColorListWidget({super.key, required this.id, required this.userID});

  final String id;
  final String userID;

  @override
  State<ColorListWidget> createState() => _ColorListWidgetState();
}

class _ColorListWidgetState extends State<ColorListWidget>
{
  @override
  Widget build(BuildContext context) => SizedBox
  (
    height: 35,
    child: ListView.builder
    (
      itemCount: AppStyle.colorsBar.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => GestureDetector
      (
        onTap: ()
        {
          final docNote = FirebaseFirestore.instance.collection(widget.userID).doc(widget.id);
          docNote.update(
          {
             "note_color": index
          }).catchError((onError)=> print(onError));

        },
        child: Container
        (
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: 50,
          decoration: BoxDecoration
          (
            color: AppStyle.colorsBar[index],
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.black,width: 0.1)
          ),
        ),
      ),
    ),
  );
}