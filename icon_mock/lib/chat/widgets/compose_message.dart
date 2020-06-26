import 'package:flutter/material.dart';
import 'package:icon_mock/widgets/focused_menu.dart';
import 'package:icon_mock/widgets/hebrew_input_text.dart';
import 'package:icon_mock/extensions/size_ext.dart';
import '../../theme.dart';

class ComposeMessage extends StatelessWidget {
  Widget _sendButton(BuildContext context) {
    return Container(
      height: context.heightPx * .048,
      width: context.heightPx * .048,
      child: FloatingActionButton(
        backgroundColor: greyDark,
        onPressed: () {},
        child: Icon(
          Icons.send,
          color: brightGold,
          size: context.heightPx * .028
        ),
      ),
    );
  }

  Widget _attachment(BuildContext context) {
    final rediansNinetyDegrees = 1.5708;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Transform.rotate(
        angle: rediansNinetyDegrees,
        child: FocusedMenuHolder(
          menuWidth: MediaQuery.of(context).size.width * 0.50,
          blurSize: 5.0,
          menuItemExtent: 45,
          menuBoxDecoration: BoxDecoration(
              color: brightGold,
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          duration: Duration(milliseconds: 100),
          animateMenuItems: true,
          blurBackgroundColor: Colors.black54,
          menuItems: <FocusedMenuItem>[
            FocusedMenuItem(
                title: HebrewText("טייג עסק", style: mediumFont),
                trailingIcon: Icon(Icons.business, color: gold),
                onPressed: () {}),
            FocusedMenuItem(
                title: HebrewText("שלח תמונה", style: mediumFont),
                trailingIcon: Icon(Icons.image, color: brightGold),
                onPressed: () {}),
          ],
          onPressed: () {},
          child: Icon(Icons.attach_file, color: greyLight),
        ),
      ),
    );
  }

  Widget _buildComposeInput() {
    return Flexible(
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: TextField(
                  // enabled: false,
                  maxLines: null,
                  style: mediumFont.copyWith(color: white),
                  decoration: InputDecoration.collapsed(
                    hintText: 'כתוב משהו...',
                    hintStyle: TextStyle(
                      color: brightGold,
                    ),
                  )),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 4),
        height: context.heightPx * .06,
        decoration: BoxDecoration(
            color: greyCompose, borderRadius: BorderRadius.circular(35)),
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: <Widget>[
            _sendButton(context),
            _attachment(context),
            _buildComposeInput(),
          ],
        ),
      ),
    );
  }
}
