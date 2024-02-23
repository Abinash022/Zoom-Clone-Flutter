import 'package:flutter/material.dart';

class ButtomNavigationTabs extends StatefulWidget {
  const ButtomNavigationTabs({super.key});

  @override
  State<ButtomNavigationTabs> createState() => _ButtomNavigationTabsState();
}

class _ButtomNavigationTabsState extends State<ButtomNavigationTabs> {
  late int selectedIndex = 0;

  final List<Widget> pages = [
    const Text('This is a Meeting Screen'),
    const Text('This is a TeamChat Screen'),
    const Text('This is a Mail Screen'),
    const Text('This is a Calendar Screen'),
    const Text('This is a More Screen'),
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
            ),
            label: 'Meetings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.group,
              color: Colors.white,
            ),
            label: 'TeamChat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.mail_outline_outlined,
              color: Colors.white,
            ),
            label: 'Mail',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today_outlined,
              color: Colors.white,
            ),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
