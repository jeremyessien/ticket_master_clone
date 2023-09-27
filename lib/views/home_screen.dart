import 'package:flutter/material.dart';
import 'package:ticket_master_clone/views/discover_screen.dart';
import 'package:ticket_master_clone/views/my_account.dart';
import 'package:ticket_master_clone/views/my_events_screen.dart';
import 'package:ticket_master_clone/views/sell_screen.dart';

import 'for_you_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const DiscoverScreen(),
    const ForYouScreen(),
    const MyEventsScreen(),
    const SellScreen(),
    const MyAccountScreen(),
  ];
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search_outlined,
                ),
                label: 'Discover'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.monitor_heart,
                ),
                label: 'For you'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.emoji_events_rounded,
                ),
                label: 'My events'),
            BottomNavigationBarItem(
                icon: Icon(Icons.money_outlined), label: 'Sell'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'My account'),
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
        ),
        body: Center(
          child: _pages[_currentIndex],
        ));
  }
}
