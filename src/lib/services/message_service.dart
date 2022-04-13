import 'package:flutter/material.dart';
import 'package:flutter_chat_app_challenge/models/message.dart';
import 'package:flutter_chat_app_challenge/models/user.dart';

class MessageService {
  
  User rafa = User(
    name: 'Rafa',
    image: 'images/ciano.png',
    color: const Color.fromRGBO(254, 222, 41, 1),
  );

  User backoffice = User(
    name: 'BackOffice',
    image: 'images/BackOffice.png',
    color: Color.fromRGBO(254, 222, 41, 1),
  );

  // Users
  List<User> getUsers() {
    return [
      rafa
    ];
  }

  // Chats
  List<Message> getChats() {
    return [
      Message(
        sender: backoffice,
        time: '18:32',
        text: 'Mensagem Mockada',
      ),
    ];
  }

  // Chat messages
  List<Message> getMessages(User sender) {
    return [
      Message(
        sender: null,
        time: '18:42',
        text: 'Mensagens que vão vir do banco',
      )
    ];
  }
}
