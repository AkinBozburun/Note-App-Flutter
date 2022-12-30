import 'dart:math';
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

  String? id;
  late final fireStore;

  @override
  void initState()
  {
    Provider.of<NoteProvider>(context,listen: false).undoDeactiveColor();
    id = widget.doc?.id ?? "note${Random().nextInt(1000)}";
    fireStore = FirebaseFirestore.instance.collection("notes").doc(id);
    _initiliazeNote();
    _titleController.text = widget.doc?["note_title"] ?? "";
    _noteController.text = widget.doc?["note"] ?? "";

    super.initState();
  }

  _initiliazeNote()
  {
    if(widget.doc?.data() == null)
    {
      fireStore.set
      ({
        "note_title" : _titleController.text,
        "note" : _noteController.text,
        "note_date" : "",
        "note_color" : 6
      });
    }
  }

  _saveNote()
  {
    if(_noteController.text != widget.doc?["note"])
    {
      fireStore.update
      ({
        "note_title" : _titleController.text,
        "note" : _noteController.text,
        "note_date" : DateTime.now().toString(),
      }).then((value)=> Navigator.pop(context));
    }
    else
    {
      Navigator.pop(context);
    }
  }

  _deleteNote()
  {
    fireStore.delete().then((value) => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      extendBodyBehindAppBar: true,
      appBar: AppBar
      (
        systemOverlayStyle: tranparentStatusBar(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: backButton(() => _saveNote()),
        actions:
        [
          undoButton(_noteController, widget.doc,context),
          IconButton(onPressed: (){}, icon: const Icon(Icons.redo_outlined),color: Colors.black),
          IconButton(onPressed: ()=> _deleteNote(), icon: const Icon(Icons.delete),color: Colors.black),
        ],
      ),
      body: Stack
      (
        alignment: Alignment.bottomLeft,
        children:
        [
          noteColor(fireStore),
          SafeArea
          (
            child: Padding
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
                  noteText(_noteController)
                ],
              ),
            ),
          ),
          Container //Color list
          (
            color: Colors.black12,
            height: 85,
            child: Column
            (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              [
                Text("${widget.doc?["note_date"] ?? ""}",style: AppStyle.dateStyle),
                ColorListWidget(id: id!),
              ],
            ),
          ),
        ],
      )
    );
  }
  Widget noteText(controller)
  {
    final prov = Provider.of<NoteProvider>(context);

    return SizedBox
    (
      height: 200,
      child: TextField //Note
      (
        controller: controller,
        onChanged: (value) => prov.undoActiveColor(value, widget.doc),
        maxLines: null,
        style: AppStyle.noteStyle,
        keyboardType: TextInputType.multiline,
        decoration: const InputDecoration
        (
          hintText: "Not",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
