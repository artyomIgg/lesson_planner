import 'package:flutter/material.dart';
import 'package:lesson_planner/models/meeting_data_source_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarUtil {
  static MeetingDataSource getDataSource() {
    final List<Appointment> meetings = <Appointment>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(
      today.year,
      today.month,
      today.day,
      9,
      0,
      0,
    );
    final DateTime endTime = startTime.add(
      const Duration(
        hours: 2,
      ),
    );
    meetings.add(
      Appointment(
        subject: 'Conference',
        startTime: startTime,
        endTime: endTime,
        color: const Color(0xFF0F8644),
      ),
    );
    return MeetingDataSource(meetings);
  }
}
