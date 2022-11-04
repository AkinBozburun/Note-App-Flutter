import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotePage extends StatefulWidget
{
  final Color gelencolor;

  const NotePage({super.key, required this.gelencolor});

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
      backgroundColor: widget.gelencolor,
      appBar: AppBar
      (
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton
        (
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.keyboard_arrow_left_outlined,color: Colors.black),
        ),
        actions:
        [
          IconButton(onPressed: (){}, icon: const Icon(Icons.undo_outlined),color: Colors.black),
          IconButton(onPressed: (){}, icon: const Icon(Icons.redo_outlined),color: Colors.black),
          IconButton(onPressed: (){}, icon: const Icon(Icons.save_outlined),color: Colors.black),
        ],
      ),
      body: Padding
      (
        padding: const EdgeInsets.all(20),
        child: Column
        (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const
          [
            Text("Note Title",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500)),
            SizedBox(height: 20),
            Text("This is the note page. You can note it here what you want."),
          ],
        ),
      ),
    );
  }
}