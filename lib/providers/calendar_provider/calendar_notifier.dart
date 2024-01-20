import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson_planner/providers/calendar_provider/calendar_state.dart';

class CalendarNotifier extends StateNotifier<CalendarState> {
  CalendarNotifier(this.selectedDate) : super(CalendarState(selectedDate));

  DateTime? selectedDate;

  void changeDate(DateTime newDate) {
    state = state.copyWith(newDate: newDate);
  }
}
