import 'package:hive/hive.dart';
import 'package:lesson_planner/models/my_appointment.dart';
import 'package:lesson_planner/models/teacher_model.dart';
import 'package:lesson_planner/services/database/appointment_local_repository/appointment_local_repository.dart';
import 'package:lesson_planner/services/hive_service.dart';

class AppointmentLocalRepositoryImpl extends AppointmentLocalRepository {
  final Box<TeacherModel> _appointmentBox;

  AppointmentLocalRepositoryImpl(this._appointmentBox);

  @override
  Future<void> addAppointment({required MyAppointment appointment}) async {
    final teacher = _appointmentBox.get(teacherKey);
    teacher?.appointments.add(appointment);
    await _appointmentBox.put(teacherKey, teacher!);
  }

  @override
  Future<void> removeAppointment({required MyAppointment appointment}) async {
    await _appointmentBox.delete(appointment.id);
  }

  @override
  Future<void> clearAppointment() async {
    await _appointmentBox.clear();
  }

  @override
  Future<List<MyAppointment>> getAllAppointments() async {
    final teacher = _appointmentBox.get(teacherKey);
    return teacher?.appointments ?? [];
  }
}
