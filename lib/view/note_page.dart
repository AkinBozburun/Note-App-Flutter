import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_notes_app/style/app_styles.dart';
import 'package:my_notes_app/widgets/color_list.dart';
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
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void initState()
  {
    _titleController.text = widget.doc["note_title"];
    _noteController.text = widget.doc["note"];
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    //int colorIndex = Provider.of<Providers>(context).index;

    return Scaffold
    (
      backgroundColor: //AppStyle.colors[colorIndex],
      AppStyle.colors[widget.doc["note_color"]],
      appBar: AppBar
      (
        systemOverlayStyle: tranparentStatusBar(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: backButton(() => Navigator.pop(context)),
        centerTitle: true,
        title: Text("${widget.doc["note_date"]}",style: AppStyle.dateStyle),
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.delete),color: Colors.black)],
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
          Container
          (
            color: Colors.black12,
            height: 85,
            child: Column
            (
              mainAxisAlignment: MainAxisAlignment.start,
              children:
              [
                Row
                (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    IconButton(onPressed: (){}, icon: const Icon(Icons.undo_outlined),color: Colors.black),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.redo_outlined),color: Colors.black),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.save_outlined),color: Colors.black),
                  ],
                ),
                const ColorListWidget(),
              ],
            ),
          ),
        ],
      )
    );
  }
}