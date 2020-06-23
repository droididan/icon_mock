import 'package:flutter/material.dart';

import '../theme.dart';
import 'hebrew_input_text.dart';

class GenderButton extends StatelessWidget {
  final bool isSelected;
  final Icon icon;
  final Function onTap;
  final String title;
  const GenderButton({
    Key key,
    @required this.isSelected,
    @required this.icon,
    @required this.onTap,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        highlightColor: isSelected ? gold : brightGold,
        onTap: onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 450),
          height: 100,
          width: 100,
          decoration:
              fieldShadow.copyWith(color: isSelected ? gold : brightGold),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            icon,
            SizedBox(height: 6),
            HebrewText(
              title,
              style: smallFont.copyWith(
                  color: Colors.black, fontWeight: FontWeight.bold),
            )
          ]),
        ),
      ),
    );
  }
}

enum Gender { male, female }
