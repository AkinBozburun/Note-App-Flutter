import 'package:flutter/material.dart';
import 'package:my_notes_app/style/app_styles.dart';

class ColorList extends StatelessWidget
{
  const ColorList({super.key});

  @override
  Widget build(BuildContext context)
  {
    return SizedBox
    (
      height: 40,
      child: ListView.builder
      (
        itemCount: AppStyle.colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector
        (
          onTap: () => print(index),
          child: Container
          (
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: 40,
            decoration: BoxDecoration
            (
              shape: BoxShape.circle,
              color: AppStyle.colors[index],
              border: Border.all(color: Colors.black,width: 0.1)
            ),
          ),
        ),
      ),
    );
  }
}