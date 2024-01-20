import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson_planner/providers/calendar_provider/calendar_notifier.dart';
import 'package:lesson_planner/providers/calendar_provider/calendar_state.dart';

final calendarStateProvider =
    StateNotifierProvider<CalendarNotifier, CalendarState>((ref) {
  return CalendarNotifier(DateTime.now());
});
