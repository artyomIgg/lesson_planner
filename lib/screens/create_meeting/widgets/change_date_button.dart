import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangeDateButton extends StatelessWidget {
  const ChangeDateButton({
    super.key,
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () => onPressed(),
      padding: const EdgeInsets.all(0),
      child: Container(
        height: 60,
        width: 120,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            'Change Date',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
