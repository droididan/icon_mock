import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:icon_mock/extensions/size_ext.dart';
import '../theme.dart';
import 'hebrew_input_text.dart';

class RecentChatsAppBar extends StatelessWidget {
  const RecentChatsAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 16, left: 10),
      height: context.heightPx * .11,
      color: greyLight,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(EvilIcons.search, size: 40, color: white),
            HebrewText(
              'צאטים',
              style: titleFont.copyWith(color: white, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
