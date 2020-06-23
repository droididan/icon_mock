import 'package:icon_mock/model/user_model.dart';

import 'message_model.dart';

class ChatModel {
  final String name;
  final String lastMessage;
  final String lastSeen;
  final List<Message> messages;

  ChatModel(this.name, this.lastMessage, this.lastSeen, this.messages);
}

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: bar,
    time: '5:30 PM',
    text: 'היי מה קורה?',
    isLiked: false,
    likes: 43,
    unread: true,
  ),
  Message(
    sender: guy,
    time: '4:30 PM',
    text: 'אייל יאאלה קפוץ לבירה',
    isLiked: false,
    likes: 0,
    unread: true,
  ),
  Message(
    sender: eyal,
    time: '12:30 PM',
    text: 'סגור, מתי זורם לך?',
    isLiked: false,
    
    unread: false,
  ),
  Message(
    sender: greg,
    time: '11:30 AM',
    text: 'הלו? מה איתי?',
    isLiked: false,
    likes: 11,
    unread: false,
  ),
];

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
    sender: greg,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: greg,
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
