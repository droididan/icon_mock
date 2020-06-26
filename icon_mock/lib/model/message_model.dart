import 'package:icon_mock/model/user_model.dart';

class Message {
  final MessageType type;
  final UserModel sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;
  final int likes;
  final String photo;
  final String tag;
  Message({
    this.tag,
    this.type = MessageType.text,
    this.photo,
    this.likes,
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });
}

enum MessageType { text, tag, photo, system }
