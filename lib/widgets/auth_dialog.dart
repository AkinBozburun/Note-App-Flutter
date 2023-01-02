import 'package:flutter/material.dart';

class AuthDialog extends StatelessWidget
{
  const AuthDialog({super.key});

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector
    (
      onTap: () => showDialog
      (
        context: context,
        builder: (context) => Dialog
        (
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          child: SizedBox
          (
            height: 200,
            child: Padding
            (
              padding: const EdgeInsets.all(8.0),
              child: Column
              (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                [
                  const ListTile
                  (
                    leading: CircleAvatar
                    (
                      radius: 30,
                      backgroundColor: Colors.blueGrey,
                      child: Text("A"),
                    ),
                    title: Text("Adı Soyadı"),
                    subtitle: Text("example@gmail.com"),
                  ),
                  Container(height: 0.5,color: const Color(0xFF383838)),
                  ElevatedButton(onPressed: () {}, child: const Text("Çıkış yap"))
                ],
              ),
            ),
          ),
        )
      ),
      child: const CircleAvatar
      (
        radius: 24,
        backgroundColor: Colors.blueGrey,
        child: Text("A"),
      ),
    );
  }
}