import 'package:flutter/material.dart';

class TodayButton extends StatelessWidget {
  const TodayButton({super.key, required this.title, this.onPressed});

  final String title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      child: Text(
        title,
      ),
    );
  }
}
