import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_notes_app/page/note_page.dart';
import 'package:my_notes_app/style/app_styles.dart';
import 'package:my_notes_app/widgets/log_out_dialog.dart';
import 'package:my_notes_app/widgets/widgets.dart';

class NotesPage extends StatefulWidget
{
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage>
{
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context)
  {
    return StreamBuilder<QuerySnapshot>
    (
      stream: FirebaseFirestore.instance.collection(user!.uid).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot)
      {
        if(snapshot.connectionState == ConnectionState.waiting)
        {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        return Scaffold
        (
          appBar: AppBar
          (
            systemOverlayStyle: tranparentStatusBar(),
            title: Column
            (
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Text("Hoşgeldin!",style: AppStyle.hiStyle),
                Text(user!.displayName ?? "kullanıcı", style: AppStyle.userNameStyle),
              ],
            ),
            backgroundColor: AppStyle.backgroundColor,
            elevation: 0,
            toolbarHeight: 90,
            leading: Stack
            (
              alignment: Alignment.center,
              children:
              [
                userAvatar(user),
              ],
            ),
            leadingWidth: 70,
            actions: const [LogOutIcon()],
          ),
          body: snapshot.data!.docs.isNotEmpty ?
          GridView
          (
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
            (
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            children: snapshot.data!.docs.map((note) => noteCards
            (
              (() => Navigator.push(context, MaterialPageRoute(builder: (context) => NotePage(doc: note,userID: user!.uid)))),
              note
            )).toList(),
          ) : const Center(child: Text("Not yok")),
          floatingActionButton: addNoteButton
          (
            ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => NotePage(doc: null,userID: user!.uid))),
          ),
        );
      }
    );
  }
}
