import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_notes_app/service/providers.dart';
import 'package:my_notes_app/style/app_styles.dart';
import 'package:my_notes_app/widgets/color_list_build.dart';
import 'package:provider/provider.dart';

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
      child: Center(child: Text(user.displayName != null ?  user.displayName[0].toUpperCase(): "K",
      style: const TextStyle(color: Colors.white))),
    ),
  ),
);

Widget noteCards(Function() tap,QueryDocumentSnapshot doc) => InkWell
(
  onTap: tap,
  child: Card
  (
    color: AppStyle.colors[doc['note_color']],
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

Widget addNoteButton(Function() navigator) => FloatingActionButton
(
  backgroundColor: Colors.blueGrey,
  shape: RoundedRectangleBorder
  (
    borderRadius: BorderRadius.circular(15),
  ),
  onPressed: navigator,
  child: const Icon(Icons.add),
);

Widget backButton(Function() press) => IconButton
(
  onPressed: press,
  icon: const Icon(Icons.keyboard_arrow_left_outlined,color: Colors.black),
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
        color: AppStyle.colors[snapshot.data?["note_color"]]
      );
    }
    return const Center();
  },
);

Widget colorsBar(doc,id,userId)
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
          Text("Düzenlenme tarihi: ${doc?["note_date"]}",style: AppStyle.dateStyle),
          const SizedBox(height: 10),
          ColorListWidget(id: id!, userID: userId),
        ],
      ),
    );
  }
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

Widget orSeparate() => Row
(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children:
  [
    Container(height: 0.4,width: 120,color: Colors.black),
    const Text("Ya da"),
    Container(height: 0.4,width: 120,color: Colors.black)
  ]
);

Widget googleLogIn(context) => InkWell
(
  onTap: ()
  {
    final prov = Provider.of<GoogleLogInProvider>(context,listen: false);
    prov.googleLogIn();
  },
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
      const Text("Google ile devam et",
      style: TextStyle(color: Colors.black,fontSize: 16)),
    ])),
  ),
);