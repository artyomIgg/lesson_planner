import 'package:flutter/material.dart';
import 'constants/constants.dart' as c;
import 'src/config/router/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Calendar Demo',
      debugShowCheckedModeBanner: false,
      theme: c.MyTheme.mainAppTheme,
      routerConfig: router,
    );
  }
}
