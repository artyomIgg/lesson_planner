import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lesson_planner/screens/calendar/calendar_screen.dart';
import 'package:lesson_planner/screens/create_meeting/create_meeting_screen.dart';
import 'package:lesson_planner/screens/home_screen/home_screen.dart';
import 'package:lesson_planner/screens/my_calendar_screen/my_calendar_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/home',
          page: HomeRoute.page,
          initial: true,
          children: [
            AutoRoute(
              path: 'my-calendar',
              page: MyCalendarRoute.page,
            ),
            AutoRoute(
              path: 'create-meeting',
              page: CreateMeetingRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: '/create-meeting',
          page: CreateMeetingRoute.page,
        ),
      ];
}
