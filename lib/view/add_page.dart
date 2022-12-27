import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_notes_app/style/app_styles.dart';
import 'package:my_notes_app/widgets/color_list.dart';
import 'package:my_notes_app/widgets/widgets.dart';

class AddNotePage extends StatefulWidget
{
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage>
{
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      backgroundColor: AppStyle.colors[5],
      appBar: AppBar
      (
        systemOverlayStyle: tranparentStatusBar(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: backButton(()
        {
          FirebaseFirestore.instance.collection("notes").add
          ({
            "note_title" : _titleController.text,
            "note" : _noteController.text,
            "note_date" : DateTime.now().toString(),
            "note_color" : 1
          }).then((value) => Navigator.pop(context)).catchError((onError)=> print(onError));
        }),
      ),
      body: Stack
      (
        alignment: Alignment.bottomCenter,
        children:
        [
          Container
          (
            color: Colors.black12,
            height: 80,
            child: Column
            (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:
              [
                Text("Düzenlenme tarihi: 26 Aralık",style: AppStyle.dateStyle),
                const ColorListWidget(doc: null,),
              ],
            ),
          ),
          Padding
          (
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column
            (
              crossAxisAlignment: CrossAxisAlignment.center,
              children:
              [
                TextField //Title
                (
                  controller: _titleController,
                  style: AppStyle.titleStyle,
                  decoration: const InputDecoration
                  (
                    hintText: "Başlık",
                    border: InputBorder.none,
                  ),
                ),
                TextField //Note
                (
                  keyboardType: TextInputType.multiline,
                  controller: _noteController,
                  maxLines: null,
                  style: AppStyle.noteStyle,
                  decoration: const InputDecoration
                  (
                    hintText: "Not",
                    border: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}