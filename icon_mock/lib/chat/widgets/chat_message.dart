import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icon_mock/model/message_model.dart';
import 'package:icon_mock/widgets/focused_menu.dart';
import 'package:icon_mock/widgets/hebrew_input_text.dart';
// import 'package:icon_mock/widgets/stories_widget.dart';

import '../../theme.dart';

class ChatMessage extends StatelessWidget {
  final int likes;
  final Message message;

  const ChatMessage({Key key, @required this.message, this.likes})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final radius = Radius.circular(12);
    return FocusedMenu(
        items: [
          FocusedMenuItem(
              onPressed: () {},
              title: HebrewText('לייק'),
              trailingIcon: Icon(EvilIcons.like)),
        ],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 6),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: brightGold,
                          borderRadius: BorderRadius.only(
                              topLeft: radius,
                              topRight: radius,
                              bottomLeft: radius)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          HebrewText(message.sender.fullName,
                              style: smallFont.copyWith(
                                color: black,
                                fontWeight: FontWeight.bold,
                              )),
                          HebrewText(message.text,
                              style: smallFont.copyWith(color: black)),
                        ],
                      )),
                  // StoryAvatar(
                  //   size: 40,
                  //   showNewIndicator: false,
                  //   url: message.sender.userUrl,
                  //   showDash: false,
                  // ),
                ],
              ),
              if (message.likes != null && message.likes > 0)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    HebrewText('${message.likes.toString()} לייק',
                        style: smallFont.copyWith(color: Colors.red)),
                    SizedBox(width: 2),
                    Icon(FontAwesomeIcons.heart, color: Colors.red, size: 16),
                  ],
                ),
            ],
          ),
        ));
  }
}

class FocusedMenu extends StatelessWidget {
  final List<FocusedMenuItem> items;
  final Function onPressed;
  final Widget child;

  const FocusedMenu(
      {Key key, @required this.items, @required this.child, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FocusedMenuHolder(
      blurSize: 5.0,
      menuItemExtent: 45,
      menuBoxDecoration: BoxDecoration(
          color: brightGold,
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      duration: Duration(milliseconds: 100),
      animateMenuItems: true,
      blurBackgroundColor: Colors.black54,
      menuItems: items,
      onPressed: onPressed,
      child: child,
    );
  }
}
