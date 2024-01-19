import 'dart:async';

import 'package:lesson_planner/services/hive_service.dart';
import 'package:lesson_planner/services/locator/locator.dart';

class AppInit {
  static Future<void> appInit() async {
    // initialize the locator
    Locator.init();

    await Future.delayed(Duration(seconds: 3), () async {
    });
  }
}