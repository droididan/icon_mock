import 'package:flutter/material.dart';
import 'package:icon_mock/extensions/size_ext.dart';
import 'package:icon_mock/search/category_model.dart';
import 'package:icon_mock/widgets/hebrew_input_text.dart';
import 'package:icon_mock/widgets/stories_widget.dart';
import '../../theme.dart';

class ChatAppBar extends StatelessWidget {
  final CategoryModel category;

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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        HebrewText(
                          category.title,
                          style: titleFont.copyWith(color: Colors.white),
                        ),
                        HebrewText('130,000 מחוברים, 11,000 אונליין',
                            style: smallFont.copyWith(color: brightGold)),
                      ],
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
