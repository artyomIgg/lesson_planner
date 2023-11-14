import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePickerModal extends StatelessWidget {
  const DatePickerModal(
      {super.key, required this.selectedDate, required this.onDateChanged});

  final DateTime selectedDate;
  final Function(DateTime) onDateChanged;

  @override
  Widget build(BuildContext context) {
    DateTime currentSelectedDate = selectedDate;
    final DateTime now = DateTime.now();
    final DateTime currentDate = DateTime(now.year, now.month, now.day);

    return SizedBox(
      height: 300,
      child: Column(
        children: [
          TextButton(
            onPressed: () => onDateChanged(currentSelectedDate),
            child: const Text('Done'),
          ),
          Expanded(
            child: CupertinoDatePicker(
              initialDateTime: selectedDate,
              onDateTimeChanged: (DateTime newDate) {
                currentSelectedDate = newDate;
              },
              minimumDate: currentDate,
              maximumDate: currentDate.add(const Duration(days: 7)),
              mode: CupertinoDatePickerMode.date,
            ),
          ),
        ],
      ),
    );
  }
}
