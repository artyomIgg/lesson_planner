import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson_planner/screens/my_calendar_screen/my_calendar_screen.dart';

import '../../../screens/create_meeting/create_meeting_body.dart';
import '../../../screens/create_meeting/create_meeting_screen.dart';
import '../../../screens/home_screen/home_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/calendar',
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomeScreen(navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _sectionNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/calendar',
              builder: (context, state) => const MyCalendarScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/create-meeting',
              builder: (context, state) => const CreateMeetingScreen(),
            ),
          ],
        )
      ],
    ),
  ],
);
