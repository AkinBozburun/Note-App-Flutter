import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_notes_app/tools/providers.dart';
import 'package:my_notes_app/style/app_styles.dart';
import 'package:my_notes_app/widgets/color_list_build.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

SystemUiOverlayStyle tranparentStatusBar() => const SystemUiOverlayStyle
(
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.dark,
);

Widget userAvatar(user)=> Padding
(
  padding: const EdgeInsets.symmetric(vertical: 20),
  child:   ClipOval
  (
    child: user.photoURL != null ? Image.network(user.photoURL,fit: BoxFit.fitHeight) :
    Container
    (
      width: 60,
      decoration: const BoxDecoration(shape: BoxShape.circle,color: Colors.blueGrey),
      child: Center(child: Text(user.displayName != null ?  user.displayName[0].toUpperCase() : "K",
      style: const TextStyle(color: Colors.white))),
    ),
  ),
);

Widget noteCards(Function() tap,QueryDocumentSnapshot doc) => InkWell
(
  onTap: tap,
  child: Card
  (
    color: AppStyle.colorsBar[doc['note_color']],
    shape: RoundedRectangleBorder
    (
      borderRadius: BorderRadius.circular(10),
    ),
    child: ListTile
    (
      contentPadding: const EdgeInsets.all(14),
      title: Text(doc["note_title"]),
      subtitle: Text(doc["note"]),
    ),
  ),
);

Widget addNoteButton(Function() navigator,txt) => FloatingActionButton.extended
(
  backgroundColor: AppStyle.orangeColor,
  onPressed: navigator,
  label: Text(txt),
  icon: const Icon(Icons.add),
);

Widget backButton(Function() press) => IconButton
(
  onPressed: press,
  icon: const Icon(Icons.keyboard_arrow_left_outlined,color: AppStyle.blackColor),
);

Widget undoButton(Function() undo,con)
{
  final prov = Provider.of<NoteProvider>(con);

  return IconButton
  (
    onPressed: undo,
    icon: const Icon(Icons.undo_outlined),color: prov.undoColor
  );
}

Widget redoButton(Function() redo,con)
{
  final prov = Provider.of<NoteProvider>(con);

  return IconButton
  (
    onPressed: redo,
    icon: const Icon(Icons.redo_outlined),
    color: prov.redoColor
  );
}

Widget deleteNoteButton(Function() delete) => IconButton
(
  onPressed: delete,
  icon: const Icon(Icons.delete),color: AppStyle.blackColor
);

Widget noteColor(fireStore) => StreamBuilder<DocumentSnapshot>
(
  stream: fireStore.snapshots(),
  builder:(context, AsyncSnapshot<DocumentSnapshot> snapshot)
  {
    if(snapshot.data?.exists ?? snapshot.hasData)
    {
      return AnimatedContainer
      (
        duration: const Duration(milliseconds: 100),
        color: AppStyle.colorsBar[snapshot.data?["note_color"]]
      );
    }
    return const Center();
  },
);

Widget colorsBar(doc,id,userId,txt)
{
  if(doc?["note_date"] == null)
  {
    return Container
    (
      height: 50,
      color: Colors.black12,
      child: Column(mainAxisAlignment: MainAxisAlignment.center,children:[ColorListWidget(id: id,userID: userId,)],
      )
    );
  }
  else
  {
    return Container //Color list
    (
      color: Colors.black12,
      height: 85,
      child: Column
      (
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        [
          Text("$txt ${doc?["note_date"]}",style: AppStyle.dateStyle),
          const SizedBox(height: 10),
          ColorListWidget(id: id!, userID: userId),
        ],
      ),
    );
  }
}

Widget mailTxtField(mailController,context)
{
  final localText = AppLocalizations.of(context)!;

  return TextFormField
  (
    controller: mailController,
    validator: (email) => email != null && !EmailValidator.validate(email)
    ? localText.validateMail : null,
    decoration:  InputDecoration
    (
      hintText: localText.mailHint,
      prefixIcon: const Icon(Icons.email),
      filled: true,
      fillColor: Colors.white,
      enabledBorder: AppStyle.txtFieldBorder,
      focusedBorder: AppStyle.txtFieldBorder,
      errorBorder : AppStyle.txtFieldBorder,
    ),
  );
}

Widget passwordTxtField(passwordController,con)
{
  final localText = AppLocalizations.of(con)!;
  final provider = Provider.of<NoteProvider>(con);

  return TextFormField
  (
    controller: passwordController,
    obscureText: provider.passwordSecure,
    validator: (value) => value != null && value.length < 6
    ? localText.validatePass : null,
    decoration: InputDecoration
    (
      hintText: localText.passwordHint,
      prefixIcon: const Icon(Icons.key),
      suffixIcon: TextButton
      (
        onPressed: () => provider.setPasswordVisible(),
        child: Text(provider.passwordSecure ? localText.passwordShow : localText.passwordHide),
      ),
      filled: true,
      fillColor: Colors.white,
      enabledBorder: AppStyle.txtFieldBorder,
      focusedBorder: AppStyle.txtFieldBorder,
      errorBorder : AppStyle.txtFieldBorder,
    ),
  );
}

Widget registerButton(Function() login,txt) => InkWell //Log In Button
(
  onTap: login,
  child: Ink
  (
    height: 50,
    decoration: BoxDecoration
    (
      color: Colors.grey.shade600,
      borderRadius: BorderRadius.circular(10)
    ),
    child: Center(child: Text(txt,
    style: const TextStyle(color: Colors.white,fontSize: 16),)),
  ),
);

Widget snackBar(txt) => SnackBar(content: Text(txt));

Widget orSeparate(txt) => Row
(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children:
  [
    Container(height: 0.4,width: 120,color: Colors.black),
    Text(txt),
    Container(height: 0.4,width: 120,color: Colors.black)
  ]
);

Widget googleLogIn(context)
{
  final localText = AppLocalizations.of(context)!;
  final prov = Provider.of<GoogleLogInProvider>(context,listen: false);

  return InkWell
  (
    onTap: ()=> prov.googleLogIn(),
    child: Ink
    (
      height: 50,
      decoration: BoxDecoration
      (
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(child: Row(mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        Image.asset("images/google.png"),
        Text(localText.signInWithGoogle,
        style: const TextStyle(color: Colors.black,fontSize: 16)),
      ])),
    ),
  );
}