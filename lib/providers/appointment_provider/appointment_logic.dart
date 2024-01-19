import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lesson_planner/models/my_appointment.dart';
import 'package:lesson_planner/models/teacher_model.dart';
import 'package:lesson_planner/services/database/appointment_local_repository/appointment_local_repository_impl.dart';
import 'package:lesson_planner/services/hive_service.dart';

class AppointmentLogic {
  static final Box<TeacherModel> _teacherBox =
      GetIt.I<HiveService>().teacherBox;

  static void addAppointment(MyAppointment appointment) async {
    await AppointmentLocalRepositoryImpl(_teacherBox)
        .addAppointment(appointment: appointment);
  }

  static void removeAppointment(MyAppointment appointment) async {
    await AppointmentLocalRepositoryImpl(_teacherBox)
        .removeAppointment(appointment: appointment);
  }

  static void removeAllAppointment() async {
    await AppointmentLocalRepositoryImpl(_teacherBox).clearAppointment();
  }

  static Future<List<MyAppointment>> getAllAppointment() async {
    final appointment =
        await AppointmentLocalRepositoryImpl(_teacherBox).getAllAppointments();
    return appointment;
  }
}
