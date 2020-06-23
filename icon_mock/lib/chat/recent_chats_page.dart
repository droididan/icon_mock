import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:icon_mock/chat/recent_chat_list.dart';
import 'package:icon_mock/theme.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:icon_mock/widgets/hebrew_input_text.dart';
import 'package:icon_mock/widgets/recent_chat_appbar.dart';
import 'package:icon_mock/widgets/stories_widget.dart';

class RecentChatsPage extends StatefulWidget {
  @override
  _RecentChatsPageState createState() => _RecentChatsPageState();
}

class _RecentChatsPageState extends State<RecentChatsPage> {
  @override
  void initState() {
    setStatusColor();
    super.initState();
  }

  setStatusColor() async {
    await FlutterStatusbarcolor.setStatusBarColor(greyLight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyDark,
      body: Stack(children: [
        ListView(
          children: <Widget>[
            RecentChatsAppBar(),
            StoriesWidget(),
            SizedBox(height: 5),
            Divider(color: divider, thickness: 1),
            _title(),
            RecentChatList()
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton(
                backgroundColor: brightGold,
                child: Icon(
                  Icons.add,
                  size: 31.0,
                  color: black,
                ),
                hoverColor: Colors.white,
                onPressed: () {}),
          ),
        )
      ]),
    );
  }

  Widget _title() {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: HebrewText('קטגוריות', style: titleFont.copyWith(color: white)));
  }
}
