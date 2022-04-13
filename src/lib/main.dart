import 'package:flutter/material.dart';
import 'package:flutter_chat_app_challenge/const.dart';
import 'package:flutter_chat_app_challenge/screens/home.dart';
import 'package:flutter_chat_app_challenge/services/client_hub_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    ClientHubService clientHubService = ClientHubService();
    
    clientHubService.startConnection();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: const Home(),
    );
  }
}
