import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lesson_planner/router/app_router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        MyCalendarRoute(),
        CreateMeetingRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return AnimatedBottomNavigationBar(
          activeIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
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
        );
      },
    );
  }
}
