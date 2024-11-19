import 'package:flutter/material.dart';
import 'package:health/src/pages/home/home_page.dart';
import 'package:health/src/pages/chat/chat_page.dart';
import 'package:health/src/pages/information/information_page.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({Key? key}) : super(key: key);

  @override
  SelectPageState createState() => SelectPageState();
}

class SelectPageState extends State<SelectPage> {
  int _selectedIndex = 0;

  void _navigateToChat() {
    setState(() => _selectedIndex = 2);
  }

  void _navigateToHealthInfo() {
    setState(() => _selectedIndex = 1);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      HomePage(
        onChatSelected: _navigateToChat,
        onHealthInfoSelected: _navigateToHealthInfo,
      ),
      const InformationPage(),
      const ChatPage(),
    ];

    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Container(
          color: Colors.white,
          key: ValueKey<int>(_selectedIndex),
          child: pages[_selectedIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            label: 'Information',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_comment),
            label: 'Chat',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() => _selectedIndex = index);
        },
      ),
    );
  }
}