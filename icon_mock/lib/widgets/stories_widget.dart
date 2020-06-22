import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:icon_mock/model/chat_model.dart';

import '../theme.dart';
import 'hebrew_input_text.dart';

class StoriesWidget extends StatelessWidget {
  final bool showDash;
  final bool showTitle;

  const StoriesWidget({Key key, this.showDash = true, this.showTitle = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        if (showTitle)
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: HebrewText('סיפורים אחרונים',
                  style: titleFont.copyWith(color: white))),
        Container(
          padding: EdgeInsets.all(8),
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: stories.length,
            itemBuilder: (context, index) {
              final story = stories[index];
              return index == 0
                  ? AddStoryButton()
                  : StoryAvatar(url: story.sender.userUrl, showDash: showDash);
            },
          ),
        ),
      ],
    );
  }
}

class AddStoryButton extends StatelessWidget {
  const AddStoryButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      dashPattern: [6, 3, 2, 3],
      borderType: BorderType.Circle,
      color: brightGold,
      strokeWidth: 1.5,
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 35.0,
        child: Icon(
          Icons.add,
          size: 30.0,
          color: Colors.white,
        ),
      ),
    );
  }
}

class StoryAvatar extends StatelessWidget {
  final bool showNewIndicator;
  final bool showDash;

  const StoryAvatar({
    Key key,
    @required this.url,
    this.showNewIndicator = true,
    this.size = 65,
    this.showDash = false,
  }) : super(key: key);

  final String url;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: <Widget>[
        DottedBorder(
          dashPattern: [6, 3, 2, 3],
          borderType: BorderType.Circle,
          color: showDash ? white : Colors.transparent,
          strokeWidth: 1.5,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(url))),
                margin: const EdgeInsets.symmetric(horizontal: 10.0)),
          ),
        ),
        if (showNewIndicator)
          Positioned(
            bottom: 5,
            right: 10,
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: greyDark,
              ),
              child: Container(
                height: 13,
                width: 13,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: green,
                ),
              ),
            ),
          )
      ],
    );
  }
}
