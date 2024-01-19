import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

part 'my_appointment.g.dart';

@HiveType(typeId: 1)
@freezed
class MyAppointment extends Appointment {
  @HiveField(0)
  final String subject;
  @HiveField(1)
  final DateTime startTime;
  @HiveField(2)
  final DateTime endTime;
  // @HiveField(3)
  // final Color color;

  MyAppointment({
    required this.subject,
    required this.startTime,
    required this.endTime,
    // required this.color,
  }) : super(
          startTime: startTime,
          endTime: endTime,
          subject: subject,
        );

  MyAppointment copyWith({
    String? subject,
    DateTime? startTime,
    DateTime? endTime,
  }) {
    return MyAppointment(
      subject: subject ?? this.subject,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }
}
