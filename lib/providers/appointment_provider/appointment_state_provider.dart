import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson_planner/providers/appointment_provider/appointment_provider.dart';
import 'package:lesson_planner/providers/appointment_provider/appointment_state.dart';

final appointmentStateProvider =
    StateNotifierProvider<AppointmentNotifier, AppointmentState>((ref) {
  return AppointmentNotifier()..fetchAppointments();
});
