import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:my_notes_app/core/provider.dart';
import 'package:my_notes_app/view/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'core/firebase_options.dart';
void main() async
{
  initializeDateFormatting();
  Intl.defaultLocale = "tr_TR";

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider
  (
    providers: [ChangeNotifierProvider(create: (context) => NoteProvider())],
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