import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icon_mock/model/message_model.dart';
import 'package:icon_mock/widgets/hebrew_input_text.dart';
import 'package:icon_mock/widgets/stories_widget.dart';

import '../../theme.dart';

class ChatMessage extends StatelessWidget {
  final int likes;
  final Message message;

  const ChatMessage({Key key, @required this.message, this.likes})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final radius = Radius.circular(12);
    return Column(
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
                        topLeft: radius, topRight: radius, bottomLeft: radius)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    HebrewText(message.sender.firstName,
                        style: smallFont.copyWith(
                          color: black,
                          fontWeight: FontWeight.bold,
                        )),
                    HebrewText(message.text,
                        style: smallFont.copyWith(color: black)),
                  ],
                )),
            StoryAvatar(
              size: 40,
              showNewIndicator: false,
              url: message.sender.userUrl,
              showDash: false,
            ),
          ],
        ),
        if (message.likes != null && message.likes > 0)
          Padding(
            padding: const EdgeInsets.only(right: 67.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                HebrewText(message.likes.toString(),
                    style: smallFont.copyWith(color: Colors.red)),
                SizedBox(width: 2),
                Icon(FontAwesomeIcons.heart, color: Colors.red, size: 16),
              ],
            ),
          ),
      ],
    );
  }
}
