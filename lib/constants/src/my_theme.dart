import 'package:flutter/material.dart';
import 'colors.dart' as c;

mixin MyTheme {
  static ThemeData mainAppTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: c.Colors.green,
        // background: c.Colors.lightGreen,
      )
  );
}