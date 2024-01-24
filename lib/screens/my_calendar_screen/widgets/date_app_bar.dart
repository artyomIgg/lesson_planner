import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'today_button.dart';

class DateAppBar extends StatelessWidget {
  const DateAppBar({super.key, required this.date, this.onPressed});

  final DateTime date;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {

    final String dayOfWeek = DateFormat('EEE').format(date);
    final String month = DateFormat('MMM').format(date);
    final String year = DateFormat('yyyy').format(date);

    final textTheme = Theme.of(context);
    final titleSmall = TextStyle(
      fontSize: 16,
      color: textTheme.textTheme.titleLarge!.color!.withOpacity(
        .5,
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            date.day.toString(),
            style: const TextStyle(
              fontSize: 44,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dayOfWeek,
                style: titleSmall,
              ),
              Text(
                '$month $year',
                style: titleSmall,
              ),
            ],
          ),
          const Spacer(),
          TodayButton(
            title: 'Today',
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
