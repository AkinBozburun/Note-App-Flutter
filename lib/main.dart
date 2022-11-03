import 'package:flutter/material.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      title: 'MyNotes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData
      (
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget
{
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar(title: const Text("Notes")),
      body: GridView.builder
      (
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => Card
        (
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