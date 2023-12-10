import 'package:flutter/material.dart';
import 'package:lesson_planner/utils/my_date_util.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key, this.onDateSelected});

  final Function(DateTime)? onDateSelected;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late DateTime selectedDate;
  late final DateTime now;

  @override
  void initState() {
    now = DateTime.now();
    selectedDate = now;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Date'),
        const SizedBox(width: 8),
        Expanded(
          child: ElevatedButton(
            onPressed: () async {
              final DateTime? date = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: now,
                lastDate: now.add(const Duration(days: 365)),
              ).then((value) {
                if (value != null) {
                  setState(() {
                    selectedDate = value;
                  });
                }
                return value;
              });
              if (date != null && widget.onDateSelected != null) {
                widget.onDateSelected!(date);
              }
            },
            child: Text(MyDateUtil.getFormattedDateYYYYMMDD(selectedDate)),
          ),
        ),
      ],
    );
  }
}
