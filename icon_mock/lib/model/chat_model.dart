import 'message_model.dart';

class ChatModel {
  final String name;
  final String lastMessage;
  final String lastSeen;
  final List<MessageModel> messages;

  ChatModel(this.name, this.lastMessage, this.lastSeen, this.messages);
}