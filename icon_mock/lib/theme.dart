import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors
const gold = Color(0xFFD59A4F);
const brightGold = Color(0xFFE0C198);
const black = Color(0xFF070707);
const greyLight = Color(0xFF222329);
const greyDark = Color(0xFF151618);
const greyCompose = Color(0xFF1F2129);
const white = Color(0xFFF6F7F7);
const subTextGrey = Color(0xFFD4D4D6);
const recentChatSubtitle = Color(0xFFD5D5D7);
const hourTextColor = Color(0xFF737579);
const green = Color(0xFF7AC88F);
const divider = Color(0xFF35373F);
const darkBlue = Color(0xFF36304A);

// Font Sizes
final smallFont = GoogleFonts.roboto(
  textStyle: TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 14),
);

final mediumFont = GoogleFonts.roboto(
  textStyle: TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 16),
);

final titleFont = GoogleFonts.roboto(
  textStyle: TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 18),
);

final hugeFont = GoogleFonts.roboto(
  textStyle: TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 30),
);

// Decorations
final fieldShadow = BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    color: Colors.white,
     
    );

final containerShadow = BoxShadow(
  color: black.withOpacity(.5),
  blurRadius: 20,
  offset: Offset(0, 7),
);

// Padding
final columnPadding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8);
