import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson_planner/constants/constants.dart' as c;
import 'package:lesson_planner/providers/calendar_provider/calendar_state_provider.dart';
import 'package:lesson_planner/screens/my_calendar_screen/widgets/date_app_bar.dart';
import 'package:lesson_planner/screens/my_calendar_screen/widgets/month_view.dart';
import 'package:lesson_planner/screens/my_calendar_screen/widgets/schedule_widget.dart';

@RoutePage()
class MyCalendarScreen extends ConsumerStatefulWidget {
  const MyCalendarScreen({super.key});

  @override
  ConsumerState<MyCalendarScreen> createState() => _MyCalendarScreenState();
}

class _MyCalendarScreenState extends ConsumerState<MyCalendarScreen> {
  late GlobalKey selectedDateKey;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(calendarStateProvider.notifier).scrollToDate(
            ref.read(calendarStateProvider).selectedDate!,
            selectedDateKey,
            Duration.zero,
          );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DateTime selectedDate =
        ref.watch(calendarStateProvider).selectedDate ?? DateTime.now();

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: DateAppBar(
          date: selectedDate,
          onPressed: () {
            final DateTime now = DateTime.now();
            selectedDateKey = GlobalObjectKey(now.day);
            ref.read(calendarStateProvider.notifier)
              ..changeDate(now)
              ..scrollToDate(now, selectedDateKey);
          },
        ),
      ),
      body: _body(context, selectedDate, ref),
    );
  }

  Widget _body(BuildContext context, DateTime selectedDate, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.symmetric(horizontal: 0).copyWith(top: 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(26),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          MonthView(
            selectedDate: selectedDate,
            onDayPressed: (date, key) {
              ref.read(calendarStateProvider.notifier)
                ..changeDate(date)
                ..scrollToDate(selectedDate, key);
            },
            date: selectedDate,
            onSelectedKeyDateChanged: (newKey) {
              selectedDateKey = newKey;
            },
          ),
          const Divider(color: c.Colors.lightGreen),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: ScheduleWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
