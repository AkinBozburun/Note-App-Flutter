import 'package:flutter/material.dart';

List colors =
[
  Colors.red.shade200,
  Colors.orange.shade200,
  Colors.yellow.shade200,
  Colors.green.shade200,
  Colors.blue.shade200,
  Colors.purple.shade200,
  Colors.grey.shade200,
];

class ColorList extends StatelessWidget
{
  const ColorList({super.key});

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
        itemBuilder: (context, index) => GestureDetector
        (
          onTap: () => print(colors[index]),
          child: Container
          (
            margin: const EdgeInsets.all(2),
            width: 50,
            decoration: BoxDecoration
            (
              color: colors[index],
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.black,width: 0.1)
            ),
          ),
        ),
      ),
    );
  }
}