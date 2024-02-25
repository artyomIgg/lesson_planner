import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'create_meeting_body.dart';
import '/src/utils/constants/constants.dart' as c;

@RoutePage()
class CreateMeetingScreen extends StatefulWidget {
  const CreateMeetingScreen({super.key});

  @override
  State<CreateMeetingScreen> createState() => _CreateMeetingScreenState();
}

class _CreateMeetingScreenState extends State<CreateMeetingScreen> {
  final List<String> selectedTimes = [];
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create new meeting', style: c.TextStyles.appBarTitle),
      ),
      body: const CreateMeetingBody(),
    );
  }
}
