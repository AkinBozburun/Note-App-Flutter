import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_notes_app/service/providers.dart';
import 'package:provider/provider.dart';

class LogOutIcon extends StatelessWidget
{
  const LogOutIcon({super.key});

  @override
  Widget build(BuildContext context)
  {
    return IconButton
    (
      icon: const Icon(Icons.logout_outlined,color: Colors.black,size: 26),
      onPressed: () => showDialog
      (
        context: context,
        builder: (context) => AlertDialog
        (
          title: const Text("Çıkış yap"),
          content: const Text("Çıkış yapmak istediğinizden emin misiniz?"),
          actions:
          [
            TextButton(onPressed:()=> Navigator.pop(context),child: const Text("Hayır")),
            TextButton(onPressed:()
            {
              final prov = Provider.of<GoogleLogInProvider>(context,listen: false);
              Navigator.pop(context);
              prov.googleLogOut();
              FirebaseAuth.instance.signOut();
            },
            child: const Text("Evet",style: TextStyle(color: Colors.red))),
          ],
        ),
      ),
    );
  }
}