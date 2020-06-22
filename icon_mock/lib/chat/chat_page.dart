import 'package:flutter/material.dart';

import 'package:icon_mock/chat/recent_chat_list.dart';
import 'package:icon_mock/theme.dart';
import 'package:icon_mock/extensions/size_ext.dart';
import 'package:icon_mock/widgets/hebrew_input_text.dart';
import 'package:icon_mock/widgets/stories_widget.dart';

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
          Expanded(
            child: ListView.builder(
              reverse: true,
              shrinkWrap: true,
              itemBuilder: (_, i) {
                return ChatMessage();
              },
            ),
          ),
          // buildInput()
        ],
      ),
    );
  }
}

Widget buildInput() {
  return Container(
    child: Row(
      children: <Widget>[
        // Button send image
        Material(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            child: IconButton(icon: Icon(Icons.image), onPressed: () {}),
            color: brightGold,
          ),
        ),
        // color: Colors.white,

        // Edit text
        Flexible(
          child: Container(
            child: TextField(
              style: TextStyle(color: Colors.black, fontSize: 15.0),
              // controller: textEditingController,
              decoration: InputDecoration.collapsed(
                hintText: 'Type your message...',
                hintStyle: TextStyle(color: gold),
              ),
              // focusNode: focusNode,
            ),
          ),
        ),

        // Button send message
        Material(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              icon: Icon(Icons.send),
              onPressed: () {},
              // onPressed: () => onSendMessage(textEditingController.text, 0),
              color: brightGold,
            ),
          ),
          color: Colors.white,
        ),
      ],
    ),
    width: double.infinity,
    height: 50.0,
    decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
        color: Colors.white),
  );
}

class ChatMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ChatAppBar extends StatelessWidget {
  final Category category;

  const ChatAppBar({Key key, @required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      color: greyLight,
      child: Column(
        children: <Widget>[
          Container(
            height: context.heightPx * .12,
            child: Padding(
              padding: EdgeInsets.only(top: context.heightPx * .04),
              child: Stack(
                children: <Widget>[
                  Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                          onPressed: () => Navigator.pop(context))),
                  Align(
                    alignment: Alignment.center,
                    child: HebrewText(
                      category.title,
                      style: titleFont.copyWith(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
          StoriesWidget(showTitle: false),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
