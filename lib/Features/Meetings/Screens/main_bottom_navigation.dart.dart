import 'package:flutter/material.dart';
import 'package:zoom_clone/log_out_sceen.dart';

import 'meeting_screen.dart';

class ButtomNavigationTabs extends StatefulWidget {
  const ButtomNavigationTabs({super.key});

  @override
  State<ButtomNavigationTabs> createState() => _ButtomNavigationTabsState();
}

class _ButtomNavigationTabsState extends State<ButtomNavigationTabs> {
  late int selectedIndex = 0;

  final List<Widget> pages = [
    const MeetingScreen(),
    const Text('This is a TeamChat Screen'),
    const Text('This is a Mail Screen'),
    const Text('This is a Calendar Screen'),
    const LogoutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: pages[selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.videocam_outlined,
              color: Colors.white,
              size: 27,
            ),
            label: 'Meetings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.group,
              color: Colors.white,
              size: 27,
            ),
            label: 'TeamChat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.mail_outline_outlined,
              color: Colors.white,
              size: 27,
            ),
            label: 'Mail',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today_outlined,
              color: Colors.white,
              size: 27,
            ),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.more_horiz,
              color: Colors.white,
              size: 27,
            ),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
