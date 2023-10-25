import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lesson_planner/utils/calendar_util.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

@RoutePage()
class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreen();
}

class _CalendarScreen extends State<CalendarScreen> {
  CalendarController calendarController = CalendarController();
  late CalendarDataSource? dataSource;

  @override
  void initState() {
    dataSource = CalendarUtil.getDataSource();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson Planner'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SfCalendar(
                view: CalendarView.week,
                monthViewSettings: const MonthViewSettings(
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.appointment),
                dataSource: dataSource,
                allowDragAndDrop: true,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).pushNamed('/create-meeting');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
