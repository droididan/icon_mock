import 'package:flutter/material.dart';

import '../theme.dart';
import 'hebrew_input_text.dart';

class BigButton extends StatelessWidget {
  final Function onTap;
  final String title;

  const BigButton({
    Key key,
    @required this.onTap,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
        child: InkWell(
          splashColor: gold,
          onTap: onTap,
          child: Container(
            alignment: Alignment.bottomCenter,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: brightGold, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: HebrewText(title,
                  style: titleFont.copyWith(
                    color: Colors.white,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
