import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_notes_app/widgets.dart';

class NotesPage extends StatefulWidget
{
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage>
{
  String gelenKullanici = "Akın Bozburun";

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
            Text(gelenKullanici,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22)),
          ],
        ),
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle
        (
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark
        ),
        elevation: 0,
        toolbarHeight: 120,
        actions: [Padding
        (
          padding: const EdgeInsets.only(right: 20),
          child: avatar(),
        )],
      ),
      body: GridView.builder
      (
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => Card
        (
          color: Colors.yellow.shade100,
          child: ListTile
          (
            title: Text("Note #${index+1}"),
            subtitle: Text("This is the note of ${index+1}"),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton
      (
        onPressed: () => print("eklendi."),
        child: const Icon(Icons.add),
      ),
    );
  }
}