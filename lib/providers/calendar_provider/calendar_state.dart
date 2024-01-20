class CalendarState {
  DateTime? selectedDate;

  CalendarState(this.selectedDate);

  CalendarState copyWith({required DateTime newDate}) {
    return CalendarState(newDate);
  }
}
