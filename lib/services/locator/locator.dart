import 'package:get_it/get_it.dart';
import 'package:lesson_planner/services/hive_service.dart';

class Locator {
  static final Locator _instance = Locator._internal();

  factory Locator.init() {
    return _instance;
  }

  Locator._internal() {
    // register all the factories
    final getIt = GetIt.instance;

    getIt.registerSingleton<HiveService>(HiveService());
  }
}
