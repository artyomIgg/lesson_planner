import 'package:flutter/material.dart';
import 'package:lesson_planner/utils/my_date_util.dart';
import 'package:lesson_planner/widgets/my_button.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({
    super.key,
    this.onTimeSelected,
    this.initDate,
    this.initStartTime,
    this.initEndTime,
  });

  final Function(DateTime, DateTime)? onTimeSelected;

  final DateTime? initDate;
  final DateTime? initStartTime;
  final DateTime? initEndTime;

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  late TimeOfDay selectedTimeFrom;
  late TimeOfDay selectedTimeTo;
  late final DateTime initDate;

  @override
  void initState() {
    initDate = widget.initDate ?? DateTime.now();
    selectedTimeFrom = widget.initStartTime != null
        ? TimeOfDay.fromDateTime(widget.initStartTime!)
        : TimeOfDay.fromDateTime(MyDateUtil.initStartTime);
    selectedTimeTo = widget.initEndTime != null
        ? TimeOfDay.fromDateTime(widget.initEndTime!)
        : TimeOfDay.fromDateTime(MyDateUtil.initEndTime);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool firstTimeIsAfterSecondTime =
        selectedTimeFrom.hour > selectedTimeTo.hour ||
            (selectedTimeFrom.hour == selectedTimeTo.hour &&
                selectedTimeFrom.minute >= selectedTimeTo.minute);

    final bool secondTimeIsAfterFirstTime =
        selectedTimeTo.hour > selectedTimeFrom.hour ||
            (selectedTimeTo.hour == selectedTimeFrom.hour &&
                selectedTimeTo.minute >= selectedTimeFrom.minute);

    final bool isFirstTimeIsAfterNow = selectedTimeFrom.hour > initDate.hour ||
        (selectedTimeFrom.hour == initDate.hour &&
            selectedTimeFrom.minute > initDate.minute);

    return Row(
      children: [
        const Text('Time'),
        const SizedBox(width: 8),
        const Text('from:'),
        const SizedBox(width: 8),
        Expanded(
          child: MyButton(
            onPressed: () async {
              await showTimePicker(
                anchorPoint: const Offset(0, 30),
                context: context,
                initialTime: selectedTimeFrom,
                initialEntryMode: TimePickerEntryMode.dial,
                // firstDate: now,
                // lastDate: now.add(const Duration(days: 365)),
              ).then((value) {
                if (value != null) {
                  setState(() {
                    selectedTimeFrom = value;
                  });

                  widget.onTimeSelected?.call(
                    MyDateUtil.getDateTimeFromTimeOfDay(selectedTimeFrom),
                    MyDateUtil.getDateTimeFromTimeOfDay(selectedTimeTo),
                  );
                }
                // return value;
              });
            },
            style: TextStyle(
              color: firstTimeIsAfterSecondTime || !isFirstTimeIsAfterNow
                  ? Colors.red
                  : null,
            ),
            text: MyDateUtil.getFormattedTimeOfDayHM(
              selectedTimeFrom,
              context,
            ),
          ),
        ),
        const SizedBox(width: 8),
        const Text('to:'),
        const SizedBox(width: 8),
        Expanded(
          child: MyButton(
            onPressed: () async {
              await showTimePicker(
                context: context,
                initialTime: selectedTimeTo,
              ).then((value) {
                if (value != null) {
                  setState(() {
                    selectedTimeTo = value;
                  });
                }
                // return value;
              });
            },
            style: TextStyle(
              color: !secondTimeIsAfterFirstTime ? Colors.red : null,
            ),
            text: MyDateUtil.getFormattedTimeOfDayHM(
              selectedTimeTo,
              context,
            ),
          ),
        ),
      ],
    );
  }
}
