import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:icon_mock/model/message_model.dart';
import 'package:icon_mock/theme.dart';
import 'package:icon_mock/widgets/hebrew_input_text.dart';

class ChatImage extends StatelessWidget {
  final Message message;

  const ChatImage({Key key, @required this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Material(
            child: CachedNetworkImage(
                placeholder: (context, url) => Container(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(brightGold)),
                    width: 200.0,
                    height: 200.0,
                    padding: EdgeInsets.all(70.0),
                    decoration: BoxDecoration(
                        color: greyDark,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)))),
                imageUrl: message.photo,
                width: 200.0,
                height: 200.0,
                fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            clipBehavior: Clip.antiAlias
          ),
          SizedBox(height: 5),
          HebrewText(
            '#${message.tag}',
            maxLines: 2,
            style: mediumFont.copyWith(color: white),
          ),
        ],
      ),
    );
  }
}
