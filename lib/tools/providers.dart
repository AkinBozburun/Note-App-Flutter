import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_notes_app/style/app_styles.dart';

class NoteProvider extends ChangeNotifier
{
  late Color undoColor;
  late Color redoColor;

  initializeColor()
  {
    undoColor = Colors.black12;
    redoColor = Colors.black12;
  }

  undoRedoColorChange(txt, doc)
  {
    if(doc?["note"] != null)
    {
      if(txt != doc?["note"])
      {
        undoColor = AppStyle.blackColor;
        redoColor = Colors.black12;
        notifyListeners();
      }
      if(txt == doc?["note"])
      {
        undoColor = Colors.black12;
        redoColor = AppStyle.blackColor;
        notifyListeners();
      }
    }
  }

  bool passwordSecure = true;

  setPasswordVisible()
  {
    passwordSecure = !passwordSecure;
    notifyListeners();
    print(passwordSecure);
  }
}

class GoogleLogInProvider extends ChangeNotifier
{
  final logIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogIn() async
  {
    try
    {
      final googleUser = await logIn.signIn();
      if(googleUser == null)
      {
        return null;
      }

      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential
      (
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    }
    catch (e)
    {
      print("sorun oluştu !!!!!! ${(e.toString())}");
    }

    notifyListeners();
  }

  Future googleLogOut() async
  {
    if(await logIn.isSignedIn())
    {
      await logIn.disconnect();
      FirebaseAuth.instance.signOut();
    }
  }
}