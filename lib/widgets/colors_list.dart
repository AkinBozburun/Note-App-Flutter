import 'package:flutter/material.dart';

class ColorList extends StatelessWidget
{
  ColorList({super.key});

  List colors =
  [
    {
      "name" : "Red",
      "color" : Colors.red.shade200,
    },
    {
      "name" : "Orange",
      "color" : Colors.orange.shade200,
    },
    {
      "name" : "Yellow",
      "color" : Colors.yellow.shade200,
    },
    {
      "name" : "Green",
      "color" : Colors.green.shade200,
    },
    {
      "name" : "Blue",
      "color" : Colors.blue.shade200,
    },
    {
      "name" : "Purple",
      "color" : Colors.purple.shade200,
    },
    {
      "name" : "Grey",
      "color" : Colors.grey.shade200,
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
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black,width: 0.1)
          ),
        ),
      ),
    );
  }
}