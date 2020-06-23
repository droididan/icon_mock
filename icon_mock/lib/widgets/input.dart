import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme.dart';

class ShadowInputBox extends StatelessWidget {
  final TextEditingController controller;
  final int maxLines;
  final int maxLength;
  final String hintText;
  final double width;
  final double height;
  final Icon icon;
  final EdgeInsets padding;
  final Function(String) onChanged;
  const ShadowInputBox({
    Key key,
    this.controller,
    this.maxLines,
    this.maxLength,
    this.hintText,
    this.width,
    this.height = 48,
    this.icon,
    this.padding = const EdgeInsets.all(0),
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        width: width,
        height: height,
        decoration: fieldShadow,
        child: Column(
          children: <Widget>[
            Container(
              child: TextField(
                onChanged: onChanged,
                autofocus: false,
                style: GoogleFonts.lato(),
                controller: controller,
                maxLines: maxLines,
                maxLength: maxLength,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    icon: icon,
                    border: InputBorder.none,
                    counterText: '',
                    hintText: hintText,
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
