import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson_planner/providers/appointment_provider/appointment_state_provider.dart';
import 'package:lesson_planner/utils/calendar_util.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

@RoutePage()
class CalendarScreen extends ConsumerWidget {
  CalendarScreen({super.key});

  final CalendarController calendarController = CalendarController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appointments = ref.watch(appointmentStateProvider).appointments;

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
                dataSource: CalendarUtil.getDataSource(appointments),
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
