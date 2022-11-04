import 'package:flutter/material.dart';

class ColorList extends StatelessWidget
{
  ColorList({super.key});

  List colors =
  [
    {
      "name" : "Red",
      "color" : Colors.red.shade100,
    },
    {
      "name" : "Orange",
      "color" : Colors.orange.shade100,
    },
    {
      "name" : "Yellow",
      "color" : Colors.yellow.shade100,
    },
    {
      "name" : "Green",
      "color" : Colors.green.shade100,
    },
    {
      "name" : "Blue",
      "color" : Colors.blue.shade100,
    },
    {
      "name" : "Purple",
      "color" : Colors.purple.shade100,
    },
    {
      "name" : "Grey",
      "color" : Colors.grey.shade100,
    },
  ];

  @override
  Widget build(BuildContext context)
  {
    return SizedBox
    (
      height: 50,
      child: ListView.builder
      (
        padding: const EdgeInsets.symmetric(horizontal: 5),
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container
        (
          margin: const EdgeInsets.all(2),
          width: 50,
          decoration: BoxDecoration
          (
            color: colors[index]["color"],

          ),
        ),
      ),
    );
  }
}