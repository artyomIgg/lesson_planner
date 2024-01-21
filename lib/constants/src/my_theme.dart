import 'package:flutter/material.dart';
import 'colors.dart' as c;

mixin MyTheme {
  static ThemeData mainAppTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: c.Colors.green,
      secondary: c.Colors.orange,
      background: c.Colors.lightGreen,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: c.Colors.red,
      hoverColor: c.Colors.greenButton,
      textTheme: ButtonTextTheme.primary,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            c.Colors.greenButton),
        foregroundColor:
            MaterialStateProperty.all<Color>(c.Colors.white),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: c.Colors.lightGreen,
    ),
  );
}
