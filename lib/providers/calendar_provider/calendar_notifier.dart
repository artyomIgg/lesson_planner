import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson_planner/providers/calendar_provider/calendar_state.dart';

class CalendarNotifier extends StateNotifier<CalendarState> {
  CalendarNotifier(this.selectedDate) : super(CalendarState(selectedDate));

  DateTime? selectedDate;
  GlobalKey? selectedDateKey;

  void changeDate(DateTime newDate) {
    selectedDate = newDate;
    state = state.copyWith(newDate: newDate);
  }

  void scrollToDate(DateTime newDate, GlobalKey newDateKey,
      [Duration? duration]) {
    selectedDate = newDate;
    selectedDateKey = newDateKey;

    if (selectedDateKey == null || selectedDateKey!.currentContext == null) {
      return;
    }

    Scrollable.ensureVisible(
      selectedDateKey!.currentContext!,
      duration: duration ?? const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      alignment: 0.5,
    );
  }
}
