import 'package:flutter/material.dart';
import 'package:lesson_planner/constants/constants.dart' as c;

class DayCard extends StatelessWidget {
  const DayCard({
    super.key,
    required this.selectedDate,
    required this.date,
    required this.isCurrentDay,
    required this.dayOfWeek,
    required this.dayOfMonth,
    this.onPressed,
  });

  final DateTime selectedDate;
  final DateTime date;
  final bool isCurrentDay;
  final String dayOfWeek;
  final String dayOfMonth;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
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
      onTap: onPressed,
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
}
