import 'package:flutter/material.dart';
import 'package:lesson_planner/utils/calendar_util.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key, required this.title});

  final String title;

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
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  // final controller = Get.put(UpdateData());
                  // controller.updateItem();
                  // // Assigned the data source
                  // dataSource = controller.calendarData;
                },
                child: const Text('add')),
            Expanded(
              child: SfCalendar(
                view: CalendarView.week,
                // monthCellBuilder: monthCellBuilder,
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
    );
  }
}