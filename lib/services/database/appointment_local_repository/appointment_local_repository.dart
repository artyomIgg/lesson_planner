import 'package:lesson_planner/models/my_appointment.dart';

abstract class AppointmentLocalRepository {
  Future<void> addAppointment({required MyAppointment appointment});
  Future<void> removeAppointment({required MyAppointment appointment});
  Future<void> clearAppointment();
  Future<List<MyAppointment>> getAllAppointments();
}
