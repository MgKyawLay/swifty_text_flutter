import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:swifty_text_flutter/views/screens/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _handleOnTap(int index) async {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _screens = <Widget>[
    const ChatScreen(),
    const Icon(EvaIcons.people),
    const Icon(EvaIcons.settings2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _handleOnTap,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(EvaIcons.messageCircleOutline), label: "Chat"),
          BottomNavigationBarItem(
              icon: Icon(EvaIcons.peopleOutline), label: "People"),
          BottomNavigationBarItem(
              icon: Icon(EvaIcons.settings2Outline), label: "Setting"),
        ],
      ),
    );
  }
}
