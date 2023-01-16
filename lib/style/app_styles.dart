import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle
{
  static const _font1 = "Archivo Narrow";
  static const _font2 = "Fredoka";
  static const _font3 = "Varela Round";
  static const _font4 = "PT Sans";
  static const _font5 = "Inter";
  static const _font6 = "Montserrat";


  static OutlineInputBorder txtFieldBorder = const OutlineInputBorder
  (
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color: backgroundColor),
  );

  TextStyle noNet = GoogleFonts.getFont(_font6,color: blackColor, fontSize: 18,fontWeight: FontWeight.w600);

  TextStyle loginTitleStyle = GoogleFonts.getFont(_font2,color: blackColor,fontSize: 30,fontWeight: FontWeight.w600);

  TextStyle hintStyle = GoogleFonts.getFont(_font3,color: Colors.grey.shade600, fontSize: 14);
  TextStyle secureButtonStyle = GoogleFonts.getFont(_font1,color: Colors.blue,fontWeight: FontWeight.w500);
  TextStyle buttonStyle = GoogleFonts.getFont(_font5,color: Colors.white,fontWeight: FontWeight.w500);

  TextStyle googleButtonStyle = GoogleFonts.getFont(_font5, color: blackColor,fontWeight: FontWeight.w500);

  TextStyle noAcountTxt = GoogleFonts.getFont(_font4,color: blackColor);
  TextStyle singUpTxt = GoogleFonts.getFont(_font4,color: Colors.blue,decoration: TextDecoration.underline);

  TextStyle hiStyle = GoogleFonts.getFont(_font4, color: Colors.grey.shade500,fontSize: 16, fontWeight: FontWeight.w600);
  TextStyle userNameStyle = GoogleFonts.getFont(_font4, color: blackColor,fontSize: 20, fontWeight: FontWeight.w600);

  static TextStyle noNotes1 = GoogleFonts.getFont(_font2,color: blackColor, fontSize: 20,fontWeight: FontWeight.w600);
  static TextStyle noNotes2 = GoogleFonts.getFont(_font3,color: Colors.grey.shade500, fontSize: 14);

  TextStyle cardTitle = GoogleFonts.getFont(_font4, fontSize: 16, color: blackColor,fontWeight: FontWeight.w600);
  TextStyle cardNote = GoogleFonts.getFont(_font4, fontSize: 14, color: Colors.black54,fontWeight: FontWeight.w500);

  TextStyle titleStyle = GoogleFonts.getFont(_font4,fontSize: 24,fontWeight: FontWeight.w800);
  TextStyle noteStyle = GoogleFonts.getFont(_font4,fontSize: 20,fontWeight: FontWeight.w500);
  TextStyle dateStyle = GoogleFonts.getFont(_font1,fontSize: 14,color: blackColor,fontWeight: FontWeight.w500);

  static const Color backgroundColor = Color(0xFFF5F5FA);
  static const Color blueColor = Color(0xFF85B6B1);
  static const Color blackColor = Color(0xFF0F1F29);

  static List colorsBar =
  [
    Colors.red.shade200,
    Colors.orange.shade200,
    Colors.yellow.shade200,
    Colors.green.shade200,
    Colors.blue.shade200,
    Colors.purple.shade200,
    Colors.grey.shade200,
    Colors.brown.shade400,
  ];
}