import 'package:flutter/material.dart';

class NoNotesAlert extends StatefulWidget
{
  const NoNotesAlert({super.key});

  @override
  State<NoNotesAlert> createState() => _NoNotesAlertState();
}

class _NoNotesAlertState extends State<NoNotesAlert>
{
  @override
  Widget build(BuildContext context)
  {
    return Center
    (
      child: Column
      (
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        [
          SizedBox
          (
            height: 100,
            width: 100,
            child: Image.asset("images/note.png")
          ),
          const SizedBox(height: 10),
          const Text("Hiç notun yok :/")
        ],
      ),
    );
  }
}