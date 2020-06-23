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
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 450),
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: isSelected ? brightGold : white),
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
