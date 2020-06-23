import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:icon_mock/theme.dart';
import 'package:icon_mock/widgets/hebrew_input_text.dart';

class ChatImage extends StatelessWidget {
  final String imageUrl;
  final String tag;

  const ChatImage({Key key, @required this.imageUrl, this.tag})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Material(
          child: CachedNetworkImage(
            placeholder: (context, url) => Container(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(brightGold),
              ),
              width: 200.0,
              height: 200.0,
              padding: EdgeInsets.all(70.0),
              decoration: BoxDecoration(
                color: greyDark,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
            imageUrl: imageUrl,
            width: 200.0,
            height: 200.0,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          clipBehavior: Clip.hardEdge,
        ),
        SizedBox(height: 5),
        HebrewText(
          '#$tag',
          style: mediumFont.copyWith(color: white),
        ),
      ],
    );
  }
}
