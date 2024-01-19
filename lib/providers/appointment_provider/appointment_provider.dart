import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson_planner/models/my_appointment.dart';
import 'package:lesson_planner/providers/appointment_provider/appointment_logic.dart';
import 'package:lesson_planner/providers/appointment_provider/appointment_state.dart';

class AppointmentNotifier extends StateNotifier<AppointmentState> {
  AppointmentNotifier() : super(AppointmentState([]));

  void addMeeting({
    required String title,
    required DateTime start,
    required DateTime end,
  }) {
    final newAppointment = MyAppointment(
      subject: title,
      startTime: start,
      endTime: end,
    );

    AppointmentLogic.addAppointment(newAppointment);

    state.appointments.add(newAppointment);
    state.appointments.sort((a, b) => a.startTime.compareTo(b.endTime));

    state = state.copyWith(appointments: state.appointments);
  }

  void removeAppointment(MyAppointment appointment) {
    state.appointments.remove(appointment);
    state = state.copyWith(appointments: state.appointments);
  }

  void updateAppointment(MyAppointment appointment) {
    state.appointments[state.appointments.indexOf(appointment)] = appointment;
    state.appointments.sort((a, b) => a.startTime.compareTo(b.endTime));
    state = state.copyWith(appointments: state.appointments);
  }

  void clearAppointment() {
    AppointmentLogic.removeAllAppointment();

    state.appointments.clear();
    state = state.copyWith(appointments: state.appointments);
  }

  Future<void> fetchAppointments() async {
    final appointments = await AppointmentLogic.getAllAppointment();
    state.appointments.clear();
    state.appointments.addAll(appointments);

    state.appointments.sort((a, b) => a.startTime.compareTo(b.endTime));
    state = state.copyWith(appointments: state.appointments);
  }
}
