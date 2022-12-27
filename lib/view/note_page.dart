import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_notes_app/core/provider.dart';
import 'package:my_notes_app/style/app_styles.dart';
import 'package:my_notes_app/widgets/color_list.dart';
import 'package:my_notes_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class NotePage extends StatefulWidget
{
  const NotePage({super.key, required this.doc});

  final QueryDocumentSnapshot? doc;

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
    _titleController.text = widget.doc?["note_title"] ?? "";
    _noteController.text = widget.doc?["note"] ?? "";
    super.initState();
  }

  //_initiliazeNote()
  //{
  //  FirebaseFirestore.instance.collection("notes").add
  //  ({
  //    "note_title" : _titleController.text,
  //    "note" : _noteController.text,
  //    "note_date" : DateTime.now().toString(),
  //    "note_color" : widget.doc?["note_color"]??6
  //  }).catchError((onError)=> print(onError));
  //}

  _updateNote()
  {
    final docUser = FirebaseFirestore.instance.collection("notes").doc(widget.doc?.id);

    if(widget.doc?["note_date"] != null)
    {
      docUser.update
      ({
        "note_title" : _titleController.text,
        "note" : _noteController.text,
        "note_date" : DateTime.now().toString(),
        //"note_color" : Provider.of<Providers>(context,listen: false).colorIndex,
      }).then((value) => Navigator.pop(context)).catchError((onError)=> print(onError));
    }
    else
    {
      FirebaseFirestore.instance.collection("notes").add
      ({
        "note_title" : _titleController.text,
        "note" : _noteController.text,
        "note_date" : DateTime.now().toString(),
        "note_color" : Provider.of<NoteProviders>(context,listen: false).colorIndex
      }).then((value) => Navigator.pop(context)).catchError((onError)=> print(onError));
    }
  }

  _deleteNote()
  {
    if(widget.doc?["note_date"] !=null)
    {
      final docUser = FirebaseFirestore.instance.collection("notes").doc(widget.doc!.id);
      docUser.delete().then((value) => Navigator.pop(context));
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      backgroundColor: AppStyle.colors[widget.doc?["note_color"] ?? 6],
      appBar: AppBar
      (
        systemOverlayStyle: tranparentStatusBar(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: backButton(() => _updateNote()),
        centerTitle: true,
        title: Text("${widget.doc?["note_date"] ?? ""}",style: AppStyle.dateStyle),
        actions: [IconButton(onPressed: ()=> _deleteNote(), icon: const Icon(Icons.delete),color: Colors.black)],
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
                    //IconButton(onPressed: (){}, icon: const Icon(Icons.save_outlined),color: Colors.black),
                  ],
                ),
                ColorListWidget(doc: widget.doc),
              ],
            ),
          ),
        ],
      )
    );
  }
}