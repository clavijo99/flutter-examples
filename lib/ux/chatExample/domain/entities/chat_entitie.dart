import 'package:examples/ux/chatExample/domain/entities/message_entitie.dart';

class ChatEntitie {
  const ChatEntitie(this.id, this.user1, this.user2, this.messages);
  final String id;
  final String user1;
  final String user2;
  final List<MessageEntitie> messages;
}
