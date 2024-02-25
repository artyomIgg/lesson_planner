import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.navigationShell, {super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeIndex: navigationShell.currentIndex,
        onTap: changeTab,
        iconSize: 28,
        activeColor:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        gapWidth: 0,
        icons: const [
          Icons.edit_calendar,
          Icons.account_box,
        ],
      ),
    );
  }

  void changeTab(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
