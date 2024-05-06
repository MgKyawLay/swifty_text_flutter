import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<StatefulWidget> createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const IconButton(
            onPressed: null, icon: Icon(EvaIcons.menuArrowOutline)),
        title: const Text("Messages"),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(EvaIcons.searchOutline),
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: const Text('test'),
      ),
    );
  }
}
