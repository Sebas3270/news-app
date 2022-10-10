import 'package:flutter/material.dart';
import 'package:news_app/providers/providers.dart';
import 'package:news_app/screens/screens.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final screenProvider = Provider.of<ScreenProvider>(context);

    return Scaffold(
      body: IndexedStack(
        index: screenProvider.currentIndex,
        children: [
          HomeScreen(),
          HeadlinesScreen(),
        ],
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

    final screenProvider = Provider.of<ScreenProvider>(context);

    return BottomNavigationBar(
      currentIndex: screenProvider.currentIndex,
      items: const [
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
      onTap: (value) => screenProvider.currentIndex = value,
    );
  }
}