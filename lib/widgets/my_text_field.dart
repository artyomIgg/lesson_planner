import 'package:flutter/material.dart';
import '../src/utils/constants/constants.dart' as c;

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.titleText,
    this.titleStyle,
    this.onChanged,
  });
  final String titleText;
  final TextStyle? titleStyle;
  final Function(String)? onChanged;

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
          onChanged: onChanged,
        ),
      ],
    );
  }
}
