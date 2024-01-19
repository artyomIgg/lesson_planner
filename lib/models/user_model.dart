import 'package:lesson_planner/models/my_appointment.dart';

abstract class UserModel {
  final List<MyAppointment> appointments;

  UserModel({required this.appointments});
}
