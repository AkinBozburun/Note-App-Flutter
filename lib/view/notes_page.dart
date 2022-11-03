import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget
{
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar(title: const Text("Notes")),
      body: GridView.builder
      (
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => Card
        (
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