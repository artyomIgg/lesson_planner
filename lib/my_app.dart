import 'package:flutter/material.dart';
import 'src/config/router/app_router.dart';
import 'src/config/themes/app_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Calendar Demo',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.mainAppTheme,
      routerConfig: router,
    );
  }
}
