import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'my_app.dart';
import 'utils/app_init.dart';

void main() async {
  await AppInit.appInit();

  runApp(const ProviderScope(child: MyApp()));
}
