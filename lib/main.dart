import 'package:flutter/material.dart';
import 'package:my_notes_app/core/provider.dart';
import 'package:my_notes_app/view/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp
  (
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MultiProvider
    (
      providers: [ChangeNotifierProvider(create: (context) => Providers())],
      child: MaterialApp
      (
        title: 'MyNotes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData
        (
          primarySwatch: Colors.blue,
        ),
        home: const NotesPage(),
      ),
    );
  }
}