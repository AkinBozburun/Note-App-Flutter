import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_notes_app/page/note_page.dart';
import 'package:my_notes_app/style/app_styles.dart';
import 'package:my_notes_app/widgets/auth_dialog.dart';
import 'package:my_notes_app/widgets/widgets.dart';

class MainPage extends StatefulWidget
{
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
{
  final user = FirebaseAuth.instance.currentUser!;

  @override
  void initState()
  {
    //FirebaseFirestore.instance.collection("user1").add({});
    super.initState();
  }

  //final userID =

  @override
  Widget build(BuildContext context) => Scaffold
  (
    appBar: AppBar
    (
      systemOverlayStyle: tranparentStatusBar(),
      title: Column
      (
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          Text("Selam",style: AppStyle.hiStyle),
          Text(" ${user.displayName ?? "Kullanici"}",style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 22)),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 100,
      actions: [Padding(padding: const EdgeInsets.only(right: 20),child: AuthDialog(user: user))],
    ),
    body: StreamBuilder<QuerySnapshot>
    (
      stream: FirebaseFirestore.instance.collection("notes").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot)
      {
        if(snapshot.connectionState == ConnectionState.waiting)
        {
          return const Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasData)
        {
          return GridView
          (
            padding: const EdgeInsets.symmetric(horizontal: 5),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
            (
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            children: snapshot.data!.docs.map((note) => noteCards
            (
              (() => Navigator.push(context, MaterialPageRoute(builder: (context) => NotePage(doc: note)))),
              note
            )).toList(),
          );
        }
        else
        {
          return const Center(child: Text("Not yok"));
        }
      },
    ),
    floatingActionButton: addNoteButton
    (
      ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => const NotePage(doc: null))),
    ),
  );
}
