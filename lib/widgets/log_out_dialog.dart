import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_notes_app/tools/providers.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogOutIcon extends StatelessWidget
{
  const LogOutIcon({super.key});

  @override
  Widget build(BuildContext context)
  {
    final localText = AppLocalizations.of(context)!;

    return IconButton
    (
      icon: const Icon(Icons.logout_outlined,color: Colors.black,size: 26),
      onPressed: () => showDialog
      (
        context: context,
        builder: (context) => AlertDialog
        (
          title: Text(localText.logOut),
          content: Text(localText.logOutAlert),
          actions:
          [
            TextButton(onPressed:()=> Navigator.pop(context),child: Text(localText.noBtn)),
            TextButton(onPressed:()
            {
              final prov = Provider.of<GoogleLogInProvider>(context,listen: false);
              Navigator.pop(context);
              prov.googleLogOut();
              FirebaseAuth.instance.signOut();
            },
            child: Text(localText.yesBtn,style: const TextStyle(color: Colors.red))),
          ],
        ),
      ),
    );
  }
}