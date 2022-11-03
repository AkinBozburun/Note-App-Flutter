import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotesPage extends StatefulWidget
{
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage>
{
  String gelenKullanici = "Akın Bozburun";

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: ListTile
        (
          title: const Text("Hoşgeldiniz!",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24)),
          subtitle: Text(gelenKullanici,style: TextStyle(color: Colors.grey.shade800,fontSize: 20)),
        ),
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle
        (
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark
        ),
        elevation: 0,
        toolbarHeight: 120,
        actions: const [Padding
        (
          padding:  EdgeInsets.only(right: 15),
          child: CircleAvatar(backgroundColor: Colors.blueGrey),
        )],
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.menu),color: Colors.grey.shade800,),
      ),
      body: GridView.builder
      (
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => Card
        (
          color: Colors.yellow.shade100,
          child: ListTile
          (
            title: Text("Note #${index+1}"),
            subtitle: Text("This is the note of ${index+1}"),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton
      (
        onPressed: () => print("eklendi."),
        child: const Icon(Icons.add),
      ),
    );
  }
}