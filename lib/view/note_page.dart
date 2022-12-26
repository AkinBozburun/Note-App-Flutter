import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_notes_app/style/app_styles.dart';
import 'package:my_notes_app/widgets/colors_list.dart';
import 'package:my_notes_app/widgets/widgets.dart';

class NotePage extends StatefulWidget
{
  const NotePage({super.key, required this.doc});

  final QueryDocumentSnapshot doc;

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      backgroundColor: AppStyle.colors[widget.doc["note_color"]],
      appBar: AppBar
      (
        systemOverlayStyle: tranparentStatusBar(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: backButton(() => Navigator.pop(context)),
        actions:
        [
          IconButton(onPressed: (){}, icon: const Icon(Icons.undo_outlined),color: Colors.black),
          IconButton(onPressed: (){}, icon: const Icon(Icons.redo_outlined),color: Colors.black),
          IconButton(onPressed: (){}, icon: const Icon(Icons.save_outlined),color: Colors.black),
        ],
      ),
      body: Stack
      (
        alignment: Alignment.bottomLeft,
        children:
        [
          Padding
          (
            padding: const EdgeInsets.all(20),
            child: Column
            (
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Text(widget.doc["note_title"],
                style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w500)),
                const SizedBox(height: 10),
                Container(color: Colors.black26,height: 1),
                const SizedBox(height: 50),
                Text(widget.doc["note"]),
              ],
            ),
          ),
          Container
          (
            color: Colors.black12,
            height: 100,
            child: Column
            (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              [
                Text("En son değiştirme tarihi: ${widget.doc["note_date"]}"),
                const ColorList(),
              ],
            ),
          ),
        ],
      )
    );
  }
}