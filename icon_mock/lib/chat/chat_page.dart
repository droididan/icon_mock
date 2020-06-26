import 'package:flutter/material.dart';
import 'package:icon_mock/chat/widgets/chat_appbar.dart';
import 'package:icon_mock/chat/widgets/chat_image.dart';
import 'package:icon_mock/chat/widgets/chat_message.dart';
import 'package:icon_mock/chat/widgets/compose_message.dart';
import 'package:icon_mock/model/chat_model.dart';
import 'package:icon_mock/model/message_model.dart';
import 'package:icon_mock/search/category_model.dart';

import 'package:icon_mock/theme.dart';
import 'package:icon_mock/extensions/size_ext.dart';
import 'package:icon_mock/widgets/hebrew_input_text.dart';

class ChatPage extends StatelessWidget {
  final CategoryModel category;

  const ChatPage({Key key, @required this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyDark,
      body: Column(
        children: <Widget>[
          ChatAppBar(category: category),
          ChatList(),
          ComposeMessage(),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  const ChatList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = chats.reversed.toList();
    return Container(
      color: greyDark,
      height: context.heightPx * .65,
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 16),
        itemCount: chats.length,
        shrinkWrap: true,
        reverse: true,
        itemBuilder: (_, i) {
          final message = list[i];
          switch (message.type) {
            case MessageType.text:
              return ChatMessage(message: message);
            case MessageType.tag:
            case MessageType.photo:
              return ChatImage(message: message);
            case MessageType.system:
              return SystemMessage(message: message);
          }
          return Container();
        },
      ),
    );
  }
}

class SystemMessage extends StatelessWidget {
  final Message message;

  const SystemMessage({Key key, @required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: white, width: .5)),
        padding: EdgeInsets.symmetric(vertical: 8),
        alignment: Alignment.center,
        child: HebrewText(
          message.text,
          style: smallFont.copyWith(color: white),
        ),
      ),
    );
  }
}
