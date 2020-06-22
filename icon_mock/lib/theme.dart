import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors
const gold = Color(0xFFD59A4F);
const brightGold = Color(0xFFE0C198);
const black = Color(0xFF070707);
const greyLight = Color(0xFF35373F);
const greyDark = Color(0xFF282A32);
const white = Color(0xFFFFFFFF);
const subTextGrey = Color(0xFFD4D4D6);
const recentChatSubtitle = Color(0xFFD5D5D7);
const hourTextColor = Color(0xFF737579);
const green = Color(0xFF7AC88F);
const divider = Color(0xFF35373F);


// Font Sizes
final smallFont = GoogleFonts.lato(
  textStyle: TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 14),
);

final mediumFont = GoogleFonts.lato(
  textStyle: TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 16),
);

final titleFont = GoogleFonts.lato(
  textStyle: TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 18),
);

final hugeFont = GoogleFonts.lato(
  textStyle: TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 30),
);

// Decorations
final fieldShadow = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: brightGold,
        blurRadius: 20,
        offset: Offset(0, 10),
      )
    ]);

// Padding
final columnPadding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8);
