import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:icon_mock/model/chat_model.dart';
import 'package:icon_mock/search/category_model.dart';

import 'package:icon_mock/theme.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:icon_mock/widgets/hebrew_input_text.dart';
import 'package:icon_mock/widgets/recent_chat_appbar.dart';
import 'package:icon_mock/widgets/stories_widget.dart';

import 'chat_page.dart';

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
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            RecentChatsAppBar(),
            StoriesWidget(),
            SizedBox(height: 5),
            _title(),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (_, i) => OpenContainer(
                  transitionDuration: Duration(milliseconds: 300),
                  closedColor: greyDark,
                  closedElevation: 0,
                  openElevation: 0,
                  transitionType: ContainerTransitionType.fade,
                  closedBuilder: (_, action) =>
                      RecentTile(categoryModel: recentChats[i], onTap: action),
                  openBuilder: (_, action) =>
                      ChatPage(category: recentChats[i])),
              itemCount: recentChats.length,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton(
                backgroundColor: brightGold,
                child: Icon(Icons.add, size: 31.0, color: black),
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
        child: HebrewText('צ׳אטים אחרונים',
            style: titleFont.copyWith(color: white)));
  }
}

class RecentTile extends StatelessWidget {
  final CategoryModel categoryModel;
  final Function onTap;

  const RecentTile({Key key, this.categoryModel, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
              color: greyLight,
              border: Border.all(color: brightGold, width: .2),
              borderRadius: BorderRadius.circular(16)),
          padding: EdgeInsets.all(8),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  HebrewText(categoryModel.title,
                      style: titleFont.copyWith(color: white)),
                  SizedBox(height: 5),
                  HebrewText(categoryModel.lastMessage,
                      style: smallFont.copyWith(color: subTextGrey)),
                ],
              ),
              SizedBox(width: 16),
              Icon(categoryModel.icon, color: brightGold),
              SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Function>('onTap', onTap));
  }
}
