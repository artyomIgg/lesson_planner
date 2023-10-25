import 'package:syncfusion_flutter_calendar/calendar.dart';

abstract class UserModel {
  final List<Appointment> schedule;

  UserModel({required this.schedule});
}
