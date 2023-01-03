import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_notes_app/main.dart';

class AuthDialog extends StatelessWidget
{
  const AuthDialog({super.key, this.user});

  final user;

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector
    (
      onTap: () => showDialog
      (
        context: context,
        builder: (context) => Dialog
        (
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          child: SizedBox
          (
            height: 200,
            child: Padding
            (
              padding: const EdgeInsets.all(0),
              child: Column
              (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                [
                  ListTile
                  (
                    leading: const CircleAvatar
                    (
                      radius: 30,
                      backgroundColor: Colors.blueGrey,
                      child: Text("A"),
                    ),
                    title: Text(user.displayName),
                    subtitle: Text(user.email),
                  ),
                  Container(height: 0.5,color: const Color(0xFF383838)),
                  ElevatedButton(onPressed:()
                  {
                    Navigator.pop(context);
                    FirebaseAuth.instance.signOut();
                  },
                  child: const Text("Çıkış yap"))
                ],
              ),
            ),
          ),
        )
      ),
      child: const CircleAvatar
      (
        radius: 24,
        backgroundColor: Colors.blueGrey,
        child: Text("A"),
      ),
    );
  }
}