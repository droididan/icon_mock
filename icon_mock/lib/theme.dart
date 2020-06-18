import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const gold = Color(0xFFD59A4F);

final smallFont = GoogleFonts.lato(
  textStyle: TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 14),
);

final mediumFont = GoogleFonts.lato(
  textStyle: TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 16),
);

final titleFont = GoogleFonts.lato(
  textStyle: TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 18),
);

final fieldShadow = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(196, 135, 198, .3),
        blurRadius: 20,
        offset: Offset(0, 10),
      )
    ]);
