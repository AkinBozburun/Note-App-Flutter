import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_notes_app/tools/providers.dart';
import 'package:my_notes_app/style/app_styles.dart';
import 'package:my_notes_app/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotePage extends StatefulWidget
{
  const NotePage({super.key, required this.doc, required this.userID});

  final QueryDocumentSnapshot? doc;
  final String userID;

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage>
{
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _noteControllerforRedo = TextEditingController();

  String? noteID;
  late final fireStore;

  @override
  void initState()
  {
    Provider.of<NoteProvider>(context,listen: false).initializeColor();
    noteID = widget.doc?.id ?? "note${Random().nextInt(1000)}";
    fireStore = FirebaseFirestore.instance.collection(widget.userID).doc(noteID);
    _initiliazeNote();
    _titleController.text = widget.doc?["note_title"] ?? "";
    _noteController.text = widget.doc?["note"] ?? "";

    super.initState();
  }

  _initiliazeNote() async
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
    if(_noteController.text != widget.doc?["note"] || _titleController != widget.doc?["note_title"])
    {
      fireStore.update
      ({
        "note_title" : _titleController.text,
        "note" : _noteController.text,
        "note_date" : DateFormat("H:mm - d MMM y",Platform.localeName).format(DateTime.now())
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
    final localText = AppLocalizations.of(context)!;

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
          undoButton(()
          {
            if(widget.doc?.data() != null)
            {
              if(_noteController.text != widget.doc?["note"])
              {
                _noteController.text = widget.doc?["note"];
              }
            }
            Provider.of<NoteProvider>(context,listen: false).undoRedoColorChange(_noteController.text, widget.doc);
          },context),
          redoButton(()
          {
            if(widget.doc?.data() != null)
            {
              if(_noteController.text == widget.doc?["note"] || _noteControllerforRedo.text != "")
              {
                _noteController.text = _noteControllerforRedo.text;
              }
            }
            Provider.of<NoteProvider>(context,listen: false).undoRedoColorChange(_noteController.text, widget.doc);
          },context),
          deleteNoteButton(() =>_deleteNote()),

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
                    style: AppStyle().titleStyle,
                    maxLines: 2,
                    decoration: InputDecoration
                    (
                      hintText: localText.noteTitle,
                      border: InputBorder.none,
                    ),
                  ),
                  noteText(_noteController,localText.note)
                ],
              ),
            ),
          ),
          colorsBar(widget.doc, noteID, widget.userID,localText.lastEdit,fireStore)
        ],
      )
    );
  }
  Widget noteText(controller,txt)
  {
    final prov = Provider.of<NoteProvider>(context);

    return SizedBox
    (
      height: 200,
      child: TextField //Note
      (
        controller: controller,
        onChanged: (value)
        {
          _noteControllerforRedo.text = _noteController.text;
          prov.undoRedoColorChange(value, widget.doc);
        },
        maxLines: null,
        style: AppStyle().noteStyle,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration
        (
          hintText: txt,
          border: InputBorder.none,
        ),
      ),
    );
  }
}