import 'package:lesson_planner/models/my_appointment.dart';

class AppointmentState {
  final List<MyAppointment> appointments;

  AppointmentState(this.appointments);

  AppointmentState copyWith({required List<MyAppointment> appointments}) {
    return AppointmentState(appointments);
  }
}
