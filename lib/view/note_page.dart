import 'package:flutter/material.dart';
import 'package:my_notes_app/widgets/colors_list.dart';
import 'package:my_notes_app/core/note_list_map.dart';
import 'package:my_notes_app/widgets/widgets.dart';

class NotePage extends StatefulWidget
{
  final Color gelencolor;
  final int gelenIndex;

  const NotePage({super.key, required this.gelencolor, required this.gelenIndex,});

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
        systemOverlayStyle: tranparentStatusBar(),
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
                Text(notes[widget.gelenIndex]["title"],
                style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w500)),
                const SizedBox(height: 20),
                Text(notes[widget.gelenIndex]["note"]),
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
                Text("En son değiştirme tarihi: ${notes[widget.gelenIndex]["lastChange"]}"),
                ColorList(),
              ],
            ),
          ),
        ],
      )
    );
  }
}