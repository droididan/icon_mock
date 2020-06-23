import 'package:flutter/material.dart';
import 'package:icon_mock/chat/recent_chat_list.dart';
import 'package:icon_mock/chat/widgets/chat_appbar.dart';
import 'package:icon_mock/chat/widgets/chat_image.dart';
import 'package:icon_mock/chat/widgets/chat_message.dart';
import 'package:icon_mock/chat/widgets/compose_message.dart';
import 'package:icon_mock/model/chat_model.dart';
import 'package:icon_mock/model/message_model.dart';
import 'package:icon_mock/theme.dart';
import 'package:icon_mock/extensions/size_ext.dart';

class ChatPage extends StatelessWidget {
  final Category category;

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
    return Container(
      color: greyDark,
      height: context.heightPx * .65,
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 16),
        itemCount: chats.length,
        shrinkWrap: true,
        reverse: true,
        itemBuilder: (_, i) {
          final message = chats[i];
          switch (message.type) {
            case MessageType.text:
              return ChatMessage(message: message);
            case MessageType.tag:
            case MessageType.photo:
              return ChatImage(imageUrl: message.photo);
          }
          return Container();
        },
      ),
    );
  }
}
