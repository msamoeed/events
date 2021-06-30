import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'size.dart';
import 'colors.dart';
import 'package:flutter/material.dart';

TextStyle t1 = GoogleFonts.montserrat(
    textStyle: TextStyle(fontSize: 17, color: Colors.black));
TextStyle t1white = GoogleFonts.montserrat(
    textStyle: TextStyle(fontSize: 17, color: Colors.white));
TextStyle t1small = GoogleFonts.montserrat(
    textStyle: TextStyle(fontSize: 14, color: Colors.white));

TextStyle t10 = GoogleFonts.montserrat(
    textStyle: TextStyle(fontSize: 17, color: Colors.black));

TextStyle t22white = GoogleFonts.montserrat(
    textStyle: TextStyle(fontSize: 22, color: Colors.white));

TextStyle t10appColor =
    GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 17, color: appColor));

TextStyle t2 = GoogleFonts.montserrat(
    textStyle: TextStyle(
        color: Colors.black, fontSize: SizeConfig.blockSizeHorizontal * 3));

TextStyle t3 = GoogleFonts.montserrat(
    textStyle: TextStyle(
        color: Color(0xff10375c),
        fontSize: SizeConfig.blockSizeHorizontal * 6));

TextStyle t4 = GoogleFonts.montserrat(
    textStyle:
        TextStyle(fontSize: 18, color: green, fontWeight: FontWeight.w700));

TextStyle t4black = GoogleFonts.montserrat(
    textStyle: TextStyle(
        fontSize: 18, color: Colors.black, fontWeight: FontWeight.w700));

TextStyle t5 = GoogleFonts.montserrat(
    textStyle: TextStyle(
        color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300));
TextStyle t7 = GoogleFonts.montserrat(
    textStyle: TextStyle(
        color: Colors.white,
        fontSize: SizeConfig.blockSizeHorizontal * 8,
        fontWeight: FontWeight.w700));

TextStyle t9 = GoogleFonts.montserrat(
    textStyle: TextStyle(
        color: appColor,
        fontSize: SizeConfig.blockSizeHorizontal * 5.5,
        fontWeight: FontWeight.w700));

TextStyle t6 = GoogleFonts.montserrat(
    textStyle: TextStyle(
        color: Color(0xFF3953a4),
        fontSize: SizeConfig.blockSizeHorizontal * 4));

TextStyle t8 = GoogleFonts.montserrat(
    textStyle: TextStyle(
        color: Colors.black,
        fontSize: SizeConfig.blockSizeHorizontal * 5.5,
        fontWeight: FontWeight.w600));

final kTitleStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'CM Sans Serif',
  fontSize: 26.0,
  height: 1.5,
);

final kSubtitleStyle = TextStyle(
  color: Colors.white,
  fontSize: 18.0,
  height: 1.2,
);
