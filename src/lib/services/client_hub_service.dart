import 'package:flutter_chat_app_challenge/listners/listners.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:signalr_netcore/signalr_client.dart';
import 'dart:developer';

class ClientHubService{

  final Listners listners = Listners();

  var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiI0YTgwOGY5OS1hMTU4LTQzOTktYWE3MS01M2NjZmIyNTU0NDAiLCJVc2VybmFtZSI6IlJpY2FyZG8gUm9jaGEiLCJUZWFtSWQiOiJlMWMxNTA4Mi1kN2MzLTQ5MTctYmM0Ny1lYjc3NjM5ZDhlNDQiLCJOb3RlSWQiOiIiLCJQcm9maWxlIjoiMSIsIm5iZiI6MTY0OTM1MDcwNSwiZXhwIjoxNjgxOTY1MTU2LCJpYXQiOjE2NDkzNTA3MDV9.vhVH_z2lQg1g9WrIGFhXme3t3znWySjI_8FbLJj_zg0";
  
  Future<String> getAccessToken() async {
    return token;
  }

  Future startConnection() async {
    final hubConnection = HubConnectionBuilder()
      .withUrl("https://chat-edp.herokuapp.com/chat", 
        options: HttpConnectionOptions(
          accessTokenFactory: () async => await getAccessToken()))
      .build();

    hubConnection.on("ReceiveMessageFromSameGroup", listners.writeMessage);

    var teamId = "eea809f5-01b5-48ee-94c0-805b6c214c3d";
    var message = "Tia jô";
    

    await hubConnection.start();

    hubConnection.invoke("SendMessageToGroupAsync", args: <Object>[teamId, message]);
  }
  
}