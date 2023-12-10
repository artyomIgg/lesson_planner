import 'package:flutter/material.dart';
import 'package:lesson_planner/screens/create_meeting/widgets/date_picker.dart';
import 'package:lesson_planner/screens/create_meeting/widgets/time_picker.dart';
import 'package:lesson_planner/widgets/my_button.dart';
import 'package:lesson_planner/widgets/my_text_field.dart';

class CreateMeetingBody extends StatelessWidget {
  const CreateMeetingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextField(
            titleText: 'Title',
          ),
          SizedBox(height: 16),
          DatePicker(),
          SizedBox(height: 8),
          TimePicker(),
          Spacer(),
          Center(child: MyButton(text: 'Create Meeting')),
        ],
      ),
    );
  }
}
