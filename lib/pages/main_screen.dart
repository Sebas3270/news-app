import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Main Screen'),
      ),
      bottomNavigationBar: _Navigation(),
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
          label: 'For you',
          icon: Icon(Icons.account_circle_outlined),
          activeIcon: Icon(Icons.account_circle),
        ),
        BottomNavigationBarItem(
          label: 'Headlines',
          icon: Icon(Icons.feed_outlined),
          activeIcon: Icon(Icons.feed),
        ),
      ],
    );
  }
}