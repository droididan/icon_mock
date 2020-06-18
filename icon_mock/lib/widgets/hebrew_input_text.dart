import 'package:flutter/material.dart';

class HebrewText extends StatelessWidget {
  const HebrewText(
    this.text, {
    Key key,
    this.style,
    this.textAlign,
    this.maxLines = 1,
    this.overflow,
  }) : super(key: key);
  final int maxLines;
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Text(
          
          text,
          overflow: overflow,
          textAlign: textAlign,
          style: style,
          maxLines: maxLines,
        ));
  }
}
