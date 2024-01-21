import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lesson_planner/constants/constants.dart' as c;
import 'package:lesson_planner/providers/calendar_provider/calendar_state_provider.dart';
import 'package:lesson_planner/screens/my_calendar_screen/widgets/today_button.dart';

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
        title: _dateAppBar(context, selectedDate),
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
          _monthView(context, selectedDate, ref),
          const Divider(color: c.Colors.lightGreen),
        ],
      ),
    );
  }

  Widget _monthView(
      BuildContext context, DateTime selectedDate, WidgetRef ref) {
    final List<DateTime> days = _getCurrentMonthDays();
    return SizedBox(
      height: 56,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: days
              .map(
                (date) => _dayCard(
                  context,
                  date,
                  selectedDate,
                  ref,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _dayCard(
    BuildContext context,
    DateTime date,
    DateTime selectedDate,
    WidgetRef ref,
  ) {
    final String dayOfWeek = DateFormat('ccccc').format(date);
    final String dayOfMonth = date.day.toString();
    final bool isCurrentDay = date.day == selectedDate.day;
    final ThemeData textTheme = Theme.of(context);
    final TextStyle titleSmall = TextStyle(
      fontSize: 12,
      color: isCurrentDay
          ? Colors.white
          : textTheme.textTheme.titleLarge!.color!.withOpacity(
              .5,
            ),
    );
    final TextStyle titleLarge = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: isCurrentDay ? Colors.white : Colors.black,
    );

    final GlobalObjectKey key = GlobalObjectKey(date.day);

    if (isCurrentDay) {
      selectedDateKey = key;
    }

    return GestureDetector(
      onTap: () {
        ref.read(calendarStateProvider.notifier)
          ..changeDate(date)
          ..scrollToDate(selectedDate, key);
      },
      child: AnimatedContainer(
        key: key,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: 40,
        decoration: BoxDecoration(
          color: isCurrentDay ? c.Colors.orange : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        duration: const Duration(milliseconds: 300),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(dayOfWeek, style: titleSmall),
            Text(dayOfMonth, style: titleLarge),
          ],
        ),
      ),
    );
  }

  List<DateTime> _getCurrentMonthDays() {
    final DateTime now = DateTime.now();
    final int daysInMonth = DateTime(now.year, now.month + 1, 0).day;
    final List<DateTime> days = [];
    for (int i = 1; i <= daysInMonth; i++) {
      days.add(DateTime(now.year, now.month, i));
    }
    return days;
  }

  Widget _dateAppBar(BuildContext context, DateTime date) {
    final String dayOfWeek = DateFormat('EEE').format(date);
    final String month = DateFormat('MMM').format(date);
    final String year = DateFormat('yyyy').format(date);

    final textTheme = Theme.of(context);
    final titleSmall = TextStyle(
      fontSize: 16,
      color: textTheme.textTheme.titleLarge!.color!.withOpacity(
        .5,
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            date.day.toString(),
            style: const TextStyle(
              fontSize: 44,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dayOfWeek,
                style: titleSmall,
              ),
              Text(
                '$month $year',
                style: titleSmall,
              ),
            ],
          ),
          const Spacer(),
          TodayButton(
            title: 'Today',
            onPressed: () {
              final DateTime now = DateTime.now();
              selectedDateKey = GlobalObjectKey(now.day);
              ref.read(calendarStateProvider.notifier)
                ..changeDate(now)
                ..scrollToDate(now, selectedDateKey);
            },
          ),
        ],
      ),
    );
  }
}
