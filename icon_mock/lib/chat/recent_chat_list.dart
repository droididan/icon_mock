import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icon_mock/theme.dart';
import 'package:icon_mock/widgets/hebrew_input_text.dart';
import 'package:animations/animations.dart';

import 'chat_page.dart';

class RecentChatList extends StatelessWidget {
  const RecentChatList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categories.length,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (_, i) {
        final category = categories[i];
        return OpenContainer(
            closedColor: greyDark,
            transitionType: ContainerTransitionType.fade,
            closedBuilder: (_, action) =>
                CategoryItem(category: category, action: action),
            openBuilder: (_, action) => ChatPage(category: category));
      },
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key key,
    @required this.category,
    this.action,
  }) : super(key: key);

  final Category category;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Card(
          elevation: 2,
          shadowColor: greyLight,
          color: greyLight,
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Icon(category.icon, color: Colors.white, size: 40),
                SizedBox(height: 16),
                HebrewText(category.title,
                    style: mediumFont.copyWith(color: white))
              ])),
          margin: EdgeInsets.all(4)),
    );
  }
}

class Category {
  final IconData icon;
  final String title;

  Category(this.icon, this.title);
}

final categories = [
  Category(FontAwesomeIcons.baseballBall, 'כתבי ספורט'),
  Category(FontAwesomeIcons.microphone, 'זמרים מזרחיים'),
  Category(FontAwesomeIcons.tv, 'בידור'),
  Category(FontAwesomeIcons.car, 'רכבים'),
  Category(FontAwesomeIcons.carCrash, 'כתבי ספורט'),
  Category(FontAwesomeIcons.caretSquareUp, 'זמרים מזרחיים'),
  Category(FontAwesomeIcons.cat, 'בידור'),
  Category(FontAwesomeIcons.chevronLeft, 'רכבים'),
];
