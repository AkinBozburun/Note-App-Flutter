import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_notes_app/service/providers.dart';
import 'package:provider/provider.dart';

class AuthDialog extends StatelessWidget
{
  const AuthDialog({super.key, this.user});

  final user;

  Widget avatar()=>
  ClipOval
  (
    child: user.photoURL != null ? Image.network(user.photoURL,fit: BoxFit.fill) :
    Container
    (
      width: 60,
      decoration: const BoxDecoration(shape: BoxShape.circle,color: Colors.blueGrey),
      child: Center(child: Text(user.displayName[0].toUpperCase(),
      style: const TextStyle(color: Colors.white))),
    ),
  );

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector
    (
      child: avatar(),
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
                    leading: avatar(),
                    title: Text(user.displayName ?? "Kullanıcı"),
                    subtitle: Text(user.email),
                  ),
                  Container(height: 0.5,color: const Color(0xFF383838)),
                  ElevatedButton(onPressed:()
                  {
                    final prov = Provider.of<GoogleLogInProvider>(context,listen: false);

                    Navigator.pop(context);
                    prov.googleLogOut();
                    FirebaseAuth.instance.signOut();
                  },
                  child: const Text("Çıkış yap"))
                ],
              ),
            ),
          ),
        )
      ),

    );
  }
}