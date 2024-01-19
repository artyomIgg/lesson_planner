import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson_planner/providers/appointment_provider/appointment_state_provider.dart';
import 'package:lesson_planner/screens/create_meeting/widgets/date_picker.dart';
import 'package:lesson_planner/screens/create_meeting/widgets/time_picker.dart';
import 'package:lesson_planner/utils/my_date_util.dart';
import 'package:lesson_planner/widgets/my_button.dart';
import 'package:lesson_planner/widgets/my_text_field.dart';

class CreateMeetingBody extends ConsumerWidget {
  const CreateMeetingBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String title = '';
    DateTime initDate = MyDateUtil.initEndTime;
    DateTime startTime = MyDateUtil.initStartTime;
    DateTime endTime = MyDateUtil.initEndTime;

    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextField(
            titleText: 'Title',
            onChanged: (value) => title = value,
          ),
          const SizedBox(height: 16),
          DatePicker(
            onDateSelected: (value) => initDate = value,
          ),
          const SizedBox(height: 8),
          TimePicker(
            onTimeSelected: (start, end) => (startTime, endTime) = (start, end),
          ),
          const Spacer(),
          Center(
            child: MyButton(
              text: 'Create Meeting',
              onPressed: () => _addMeeting(
                ref: ref,
                title: title,
                date: initDate,
                startTime: startTime,
                endTime: endTime,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addMeeting({
    required WidgetRef ref,
    required String title,
    required DateTime? date,
    required DateTime? startTime,
    required DateTime? endTime,
  }) {
    if (title.isEmpty || date == null || startTime == null || endTime == null) {
      return;
    }

    ref.read(appointmentStateProvider.notifier).addMeeting(
          title: title,
          start: startTime,
          end: endTime,
        );
  }
}
