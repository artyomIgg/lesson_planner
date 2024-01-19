import 'package:lesson_planner/models/meeting_data_source_model.dart';
import 'package:lesson_planner/models/my_appointment.dart';

class CalendarUtil {
  static AppointmentDataSource getDataSource(List<MyAppointment> appointments) {
    return AppointmentDataSource(appointments);
  }


}
