import 'package:flutter/material.dart';

Widget avatar() => GestureDetector
  (
    onTap: () => print("auth"),
    child: const CircleAvatar
    (
      radius: 24,
      backgroundColor: Colors.blueGrey,
      child: Text("A"),
    ),
  );