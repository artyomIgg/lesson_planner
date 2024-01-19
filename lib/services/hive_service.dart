import 'package:hive_flutter/hive_flutter.dart';
import 'package:lesson_planner/models/my_appointment.dart';
import 'package:lesson_planner/models/teacher_model.dart';

const String teacherKey = 'teacherKey';

class HiveService {
  late Box<TeacherModel> _teacherBox;

  // hive service constructor
  HiveService(
  ) {
    _init();
  }

  Box<TeacherModel> get teacherBox => _teacherBox;

  Future<void> _init() async {
    await Hive.initFlutter();

    await _registerAdapters();

    await _openBoxes();
  }

  Future<void> _registerAdapters() async {
    Hive.registerAdapter(TeacherModelAdapter());
    Hive.registerAdapter(MyAppointmentAdapter());
  }

  Future<void> _openBoxes() async {
    _teacherBox = await Hive.openBox<TeacherModel>(teacherKey);

    if(_teacherBox.isEmpty) {
      _teacherBox.put(teacherKey, TeacherModel(appointments: []));
    }
  }
}
