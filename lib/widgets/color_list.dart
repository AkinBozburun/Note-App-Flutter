import 'package:flutter/material.dart';
import 'package:my_notes_app/core/provider.dart';
import 'package:my_notes_app/style/app_styles.dart';
import 'package:provider/provider.dart';

class ColorListWidget extends StatelessWidget
{
  const ColorListWidget({super.key});

  @override
  Widget build(BuildContext context) =>SizedBox
  (
    height: 30,
    child: ListView.builder
    (
      itemCount: AppStyle.colors.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => GestureDetector
      (
        onTap: () => Provider.of<Providers>(context,listen: false).changeColor(index),
        child: Container
        (
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: 40,
          decoration: BoxDecoration
          (
            color: AppStyle.colors[index],
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.black,width: 0.1)
          ),
        ),
      ),
    ),
  );
}