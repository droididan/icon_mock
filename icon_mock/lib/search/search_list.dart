import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icon_mock/chat/chat_page.dart';
import 'package:icon_mock/theme.dart';
import 'package:icon_mock/widgets/hebrew_input_text.dart';

import 'category_model.dart';

class SearchList extends StatelessWidget {
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

  final CategoryModel category;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(width: .3, color: brightGold),
              borderRadius: BorderRadius.circular(16)),
          elevation: 2,
          shadowColor: greyLight,
          color: greyLight,
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Icon(category.icon, color: Colors.white, size: 32),
                SizedBox(height: 16),
                HebrewText(category.title,
                    style: mediumFont.copyWith(color: white))
              ])),
          margin: EdgeInsets.all(6)),
    );
  }
}

final categories = [
  CategoryModel(icon: FontAwesomeIcons.tv, title: 'בידור'),
  CategoryModel(icon: FontAwesomeIcons.microphone, title: 'שפים'),
  CategoryModel(icon: FontAwesomeIcons.footballBall, title: 'כתבי ספורט'),
  CategoryModel(icon: FontAwesomeIcons.camera, title: 'האח הגדול'),
  CategoryModel(icon: FontAwesomeIcons.star, title: 'הכוכב הבא'),
  CategoryModel(icon: FontAwesomeIcons.microphoneAlt, title: 'זמרים מזרחיים'),
  CategoryModel(icon: FontAwesomeIcons.sun, title: 'הישרדות'),
  CategoryModel(icon: FontAwesomeIcons.car, title: 'רכבים'),
];
