import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icon_mock/model/user_model.dart';
import 'package:icon_mock/search/category_model.dart';

import 'message_model.dart';

class ChatModel {
  final String name;
  final String lastMessage;
  final String lastSeen;
  final List<Message> messages;

  ChatModel(this.name, this.lastMessage, this.lastSeen, this.messages);
}

List<CategoryModel> recentChats = [
  CategoryModel(
      icon: FontAwesomeIcons.baseballBall,
      title: 'בידור',
      lastMessage: 'נטלי דדון: היי לכולם'),
  CategoryModel(
      icon: FontAwesomeIcons.microphone,
      title: 'שפים',
      lastMessage: 'יוסי שיטרית: פתחתי מסעדה חדשה'),
  CategoryModel(
      icon: FontAwesomeIcons.tv,
      title: 'כתבי ספורט',
      lastMessage: 'טל בן-חיים: יווו איזה משחק היה'),
  CategoryModel(
      icon: FontAwesomeIcons.car,
      title: 'האח הגדול',
      lastMessage: 'ארז טל: הדיירת החדשה שלנו מגיעה מחר'),
  CategoryModel(
      icon: FontAwesomeIcons.car,
      title: 'הכוכב הבא',
      lastMessage: 'אסי עזר: נתנה בשיר, הרגה אותי'),
];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: asi,
    time: '5:30 PM',
    type: MessageType.tag,
    isLiked: false,
    tag: 'HOLMSPLACE\nסיימתי אימון, איפה אוכלים?',
    photo:
        'https://lh3.googleusercontent.com/proxy/3jokv3riOZkms0hpozKr7fTu_WJc6HCj_Y9_t9-kkSDap_1QlAPe-dyte2NP_3wFiJXylg7swGt86xS_y66H3PX_idZeTI_56BsoPMH-I7RWrnBVr4GjOUsb',
    likes: 43,
    unread: true,
  ),
  Message(
    sender: rotem,
    time: '5:43 PM',
    text: 'מה בא לך, חיים שלי?',
    isLiked: false,
    likes: 43,
    unread: true,
  ),
  Message(
    sender: guy,
    time: '6:01 PM',
    text: 'אישתי מכינה היום אוכל איטלקי מטורף',
    isLiked: false,
    likes: 0,
    unread: true,
  ),
  Message(
    sender: asi,
    time: '6:04 PM',
    text: 'בלי פחמימות!!!!!',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: eden,
    time: '6:07 PM',
    text: 'חיים שלי בוא לקוסקוס',
    isLiked: false,
    likes: 11,
    unread: false,
  ),
  Message(
    time: '6:12 PM',
    type: MessageType.system,
    text: 'אסי עזר הוסיף את נטלי דדון לקבוצת הבידר',
  ),
  Message(
    sender: rotem,
    time: '6:37 PM',
    text: 'יאללה אני באה',
    isLiked: false,
    likes: 11,
    unread: false,
  ),
  Message(sender: asi, time: '6:38 PM', text: 'הרגת אותי!', likes: 23),
  Message(
      sender: natali,
      time: '6:38 PM',
      text: 'היי לכולם \uD83D\uDE18',
      likes: 23),
];

List<Message> get chatsList => chats.reversed;

List<Message> stories = [
  Message(
    sender: bar,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: guy,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: eyal,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: asi,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: natali,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: bar,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: bar,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: bar,
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: bar,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  ),
];
