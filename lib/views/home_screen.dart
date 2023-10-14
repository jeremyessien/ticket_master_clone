import 'package:flutter/material.dart';
import 'package:ticket_master_clone/views/discover_screen.dart';
import 'package:ticket_master_clone/views/my_account.dart';
import 'package:ticket_master_clone/views/my_events_screen.dart';
import 'package:ticket_master_clone/views/sell_screen.dart';
import 'package:ticket_master_clone/views/view_event.dart';

import 'for_you_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _bottomNavBarVisible = true;
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const DiscoverScreen(),
    const ForYouScreen(),
    const ViewEvents(),
    const SellScreen(),
    const MyAccountScreen(),
  ];
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _toggleBottomNavBar() {
    setState(() {
      _bottomNavBarVisible = !_bottomNavBarVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Visibility(
          visible: _bottomNavBarVisible,
          child: BottomNavigationBar(
            elevation: 0,
            currentIndex: _currentIndex,
            onTap: _onTabTapped,
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search_outlined,
                    size: 36,
                  ),
                  label: 'Discover'),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/heart.jpg', height: 36), label: 'For you'),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/ticket icon.jpg', height: 36,),
                  label: 'My events'),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/money.jpg', height: 36), label: 'Sell'),
              const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle_rounded,
                    size: 38,
                  ),
                  label: 'My account'),
            ],
            selectedItemColor: const Color(0xff0566ea),
            unselectedItemColor: Colors.grey,
          ),
        ),
        body: GestureDetector(
          onTap: _toggleBottomNavBar,
          child: _pages[_currentIndex],
        ));
  }
}
