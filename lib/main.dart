import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson_planner/my_app.dart';
import 'package:lesson_planner/router/app_route_init.dart';
import 'package:lesson_planner/utils/app_init.dart';

void main() async {
  await AppInit.appInit();

  runApp(ProviderScope(child: MyApp(appRouter: AppRouteInit.initAppRoute())));
}
