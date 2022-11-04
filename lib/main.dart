import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_notes_app/view/notes_page.dart';
void main()
{
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle
  (
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      title: 'MyNotes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData
      (
        primarySwatch: Colors.blue,
      ),
      home: const NotesPage(),
    );
  }
}