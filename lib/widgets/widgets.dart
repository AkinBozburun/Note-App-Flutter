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
      child: Center(child: Text(user.displayName != null ?
      user.displayName[0].toUpperCase() : user.email[0].toUpperCase(),
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
      borderRadius: BorderRadius.circular(8),
    ),
    child: Container
    (
      padding: const EdgeInsets.all(15),
      child: Column
      (
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          Text
          (
            doc["note_title"],style: AppStyle().cardTitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          const SizedBox(height: 6),
          Text
          (
            doc["note"],style: AppStyle().cardNote,
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
          ),
        ],
      ),
    ),
  ),
);

Widget addNoteButton(Function() navigator,txt) => FloatingActionButton
(
  heroTag: null,
  backgroundColor: AppStyle.blackColor,
  onPressed: navigator,
  elevation: 6,
  child: const Icon(Icons.add),
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

Widget colorsBar(doc,id,userId,txt,fireStore)=> StreamBuilder<DocumentSnapshot>
(
  stream: fireStore.snapshots(),
  builder:(context, AsyncSnapshot<DocumentSnapshot> snapshot)
  {
    if(snapshot.data?.exists ?? snapshot.hasData)
    {
      return AnimatedContainer
      (
        duration: const Duration(milliseconds: 100),
        height: doc?["note_date"] == null ? 60 : 85,
        decoration: BoxDecoration
        (
          color: AppStyle.colorsBar[snapshot.data?["note_color"]],
          boxShadow: const [ BoxShadow
          (
             color: AppStyle.blackColor,
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 5),
          )]
        ),
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children: doc?["note_date"] != null ?
          [
            Text("$txt ${doc?["note_date"]}",style: AppStyle().dateStyle),
            const SizedBox(height: 10),
            ColorListWidget(id: id,userID: userId)
          ] : [ColorListWidget(id: id,userID: userId)],
        )
      );
    }
    return const Center();
  },
);

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
      hintStyle: AppStyle().hintStyle,
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
      hintStyle: AppStyle().hintStyle,
      prefixIcon: const Icon(Icons.key),
      suffixIcon: TextButton
      (
        onPressed: () => provider.setPasswordVisible(),
        child: Text(provider.passwordSecure ? localText.passwordShow : localText.passwordHide,style: AppStyle().secureButtonStyle),
      ),
      filled: true,
      fillColor: Colors.white,
      enabledBorder: AppStyle.txtFieldBorder,
      focusedBorder: AppStyle.txtFieldBorder,
      errorBorder : AppStyle.txtFieldBorder,
    ),
  );
}

Widget confirmPassField(passwordController,passwordConfirmController,con)
{
  final localText = AppLocalizations.of(con)!;
  final provider = Provider.of<NoteProvider>(con);

  return TextFormField
  (
    controller: passwordConfirmController,
    obscureText: provider.passwordSecure,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: (value) => value != null && value != passwordController.text
    ? localText.validateConfirmPass : null,
    decoration: InputDecoration
    (
      hintText: localText.confirmPass,
      prefixIcon: const Icon(Icons.key),
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
      color: AppStyle.blackColor,
      borderRadius: BorderRadius.circular(10)
    ),
    child: Center(child: Text(txt,
    style: AppStyle().buttonStyle)),
  ),
);

Widget orSeparate(txt) => Row
(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children:
  [
    Container(height: 0.4,width: 120,color: Colors.black),
    Text(txt,style: AppStyle().noAcountTxt),
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
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(child: Row(mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        Image.asset("images/google.png"),
        Text(localText.signInWithGoogle,
        style: AppStyle().googleButtonStyle),
      ])),
    ),
  );
}