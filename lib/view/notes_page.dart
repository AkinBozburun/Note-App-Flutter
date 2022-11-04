import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_notes_app/view/note_page.dart';
import 'package:my_notes_app/widgets.dart';

class NotesPage extends StatefulWidget
{
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage>
{
  String kullanici = "Akın Bozburun";

  Color noteColor = Colors.grey.shade300;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Column
        (
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Text("Welcome",style: TextStyle(color: Colors.grey.shade600,fontSize: 16)),
            Text(kullanici,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 22)),
          ],
        ),
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle
        (
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark
        ),
        elevation: 0,
        toolbarHeight: 100,
        actions: [Padding
        (
          padding: const EdgeInsets.only(right: 20),
          child: avatar(),
        )],
      ),
      body: GridView.builder
      (
        padding: const EdgeInsets.symmetric(horizontal: 5),
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
        (
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (context, index) => GestureDetector
        (
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NotePage
          (
            gelencolor: noteColor,
          ))),
          child: noteCard(index,noteColor)
        ),
      ),
      floatingActionButton: addNoteButton(),
    );
  }
}