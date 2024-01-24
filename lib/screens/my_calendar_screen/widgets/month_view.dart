import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lesson_planner/constants/constants.dart' as c;

class MonthView extends StatelessWidget {
  const MonthView({
    super.key,
    required this.selectedDate,
    required this.date,
    required this.onDayPressed,
    required this.onSelectedKeyDateChanged,
  });

  final DateTime selectedDate;
  final DateTime date;
  final Function(DateTime date, GlobalKey key)? onDayPressed;
  final Function(GlobalKey key)? onSelectedKeyDateChanged;

  @override
  Widget build(BuildContext context) {
    final List<DateTime> days = _getCurrentMonthDays();
    return SizedBox(
      height: 56,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: days
              .map(
                (date) => _dayCard(
                  context: context,
                  date: date,
                  onPressed: onDayPressed,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _dayCard({
    required BuildContext context,
    required DateTime date,
    Function(DateTime date, GlobalKey key)? onPressed,
  }) {
    final String dayOfWeek = DateFormat('ccccc').format(date);
    final String dayOfMonth = date.day.toString();
    final bool isCurrentDay = date.day == selectedDate.day;

    final GlobalObjectKey key = GlobalObjectKey(date.day);

    if (isCurrentDay) {
      onSelectedKeyDateChanged!(key);
    }
    final ThemeData textTheme = Theme.of(context);
    final TextStyle titleSmall = TextStyle(
      fontSize: 12,
      color: isCurrentDay
          ? Colors.white
          : textTheme.textTheme.titleLarge!.color!.withOpacity(
              .5,
            ),
    );
    final TextStyle titleLarge = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: isCurrentDay ? Colors.white : Colors.black,
    );

    return GestureDetector(
      onTap: () {
        onPressed!(date, key);
      },
      child: AnimatedContainer(
        key: key,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: 40,
        decoration: BoxDecoration(
          color: isCurrentDay ? c.Colors.orange : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        duration: const Duration(milliseconds: 300),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(dayOfWeek, style: titleSmall),
            Text(dayOfMonth, style: titleLarge),
          ],
        ),
      ),
    );
  }

  List<DateTime> _getCurrentMonthDays() {
    final DateTime now = DateTime.now();
    final int daysInMonth = DateTime(now.year, now.month + 1, 0).day;
    final List<DateTime> days = [];
    for (int i = 1; i <= daysInMonth; i++) {
      days.add(DateTime(now.year, now.month, i));
    }
    return days;
  }
}
