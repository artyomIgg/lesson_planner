import 'package:hive/hive.dart';
import 'package:lesson_planner/models/my_appointment.dart';
import 'package:lesson_planner/models/user_model.dart';

part 'teacher_model.g.dart';

@HiveType(typeId: 2)
class TeacherModel extends HiveObject implements UserModel {
  @override
  @HiveField(0)
  final List<MyAppointment> appointments;

  TeacherModel({required this.appointments});
}
