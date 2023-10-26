import 'package:flutter/material.dart';
import 'package:lesson_planner/my_app.dart';
import 'package:lesson_planner/router/app_route_init.dart';

void main() {
  runApp(MyApp(appRouter: AppRouteInit.initAppRoute()));
}
