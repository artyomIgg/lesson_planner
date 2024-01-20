import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lesson_planner/screens/calendar/calendar_screen.dart';
import 'package:lesson_planner/screens/create_meeting/create_meeting_screen.dart';
import 'package:lesson_planner/screens/my_calendar_screen/my_calendar_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/calendar',
          page: MyCalendarRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: '/create-meeting',
          page: CreateMeetingRoute.page,
        ),
      ];
}
