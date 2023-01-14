import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_notes_app/page/notes_page.dart';
import 'package:my_notes_app/page/user_form_page.dart';
import 'package:my_notes_app/widgets/widgets.dart';

class AuthPage extends StatefulWidget
{
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
{
  @override
  Widget build(BuildContext context)
  {
    return StreamBuilder<User?>
    (
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot)
      {
        if(snapshot.hasData)
        {
          return const NotesPage();
        }
        else if(snapshot.hasError)
        {
          return snackBar("Bir sorun oluştu!");
        }
        else
        {
          return const UserFormPage();
        }
      }
    );
  }
}