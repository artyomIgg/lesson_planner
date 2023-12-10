import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDateUtil {
  static String getFormattedDateYYYYMMDD(DateTime date) {
    final DateFormat formatter = DateFormat('yMMMMEEEEd');
    final result = formatter.format(date);
    return result;
  }

  static String getFormattedTimeOfDayHM(
    TimeOfDay timeOfDay,
    BuildContext context,
  ) {
    final bool is24HourFormat = MediaQuery.of(context).alwaysUse24HourFormat;

    String hour = timeOfDay.hour.toString();
    String minute = timeOfDay.minute.toString();

    if (!is24HourFormat && timeOfDay.period == DayPeriod.pm) {
      hour = (timeOfDay.hourOfPeriod).toString();
    }

    if (hour.length == 1) hour = '0$hour';
    if (minute.length == 1) minute = '0$minute';

    return '$hour:$minute ${is24HourFormat ? '' : timeOfDay.period.toString().split('.').last.toUpperCase()}';
  }
}
