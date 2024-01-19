import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDateUtil {
  static final DateTime _createMeetingDateInit = DateTime.now();
  static DateTime get createMeetingDate => _createMeetingDateInit;
  static DateTime get initStartTime =>
      _createMeetingDateInit.add(const Duration(minutes: 5));
  static DateTime get initEndTime =>
      _createMeetingDateInit.add(const Duration(minutes: 35));

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

  static getDateTimeFromTimeOfDay(TimeOfDay timeOfDay) {
    final DateTime now = DateTime.now();
    return DateTime(
      now.year,
      now.month,
      now.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );
  }
}
