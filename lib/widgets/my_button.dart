import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, this.onPressed, required this.text, this.style});

  final String text;
  final Function()? onPressed;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text, style: style),
    );
  }
}
