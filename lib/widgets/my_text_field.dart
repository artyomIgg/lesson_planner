import 'package:flutter/material.dart';
import 'package:lesson_planner/constants/constants.dart' as c;

class MyTextField extends StatelessWidget {
  const MyTextField({super.key, required this.titleText, this.titleStyle});
  final String titleText;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    final TextStyle labelText = titleStyle ?? c.TextStyles.textFieldLabel;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titleText, style: labelText),
        TextField(
          style: c.TextStyles.textFieldText,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 4,
            ),
          ),
        ),
      ],
    );
  }
}
