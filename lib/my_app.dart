import 'package:flutter/material.dart';
import 'package:lesson_planner/router/app_router.dart';
import 'package:lesson_planner/constants/constants.dart' as c;

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Calendar Demo',
      debugShowCheckedModeBanner: false,
      theme: c.MyTheme.mainAppTheme,
      routerConfig: appRouter.config(),
    );
  }
}
