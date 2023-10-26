import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        title: const Text('Create Meeting'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 52),
            child: Column(
              children: [
                _changeDateButton(),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _generateTimeCells(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _timeCell(String time) {
    return CupertinoButton(
      onPressed: () {
        setState(() {
          onCellTap(time);
        });
      },
      padding: const EdgeInsets.all(0),
      child: Container(
        height: 60,
        width: 120,
        decoration: BoxDecoration(
          color: isSelectedTime(time) ? Colors.green : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            time,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  // generate time cell with 30 minutes interval from 8:00 to 20:00, if time is before now then not add to list
  List<Widget> _generateTimeCells() {
    final List<Widget> timeCells = [];
    final DateTime now = selectedDate;
    final DateTime startTime = DateTime(now.year, now.month, now.day, 0, 0);
    final DateTime endTime = DateTime(now.year, now.month, now.day, 20, 0);
    DateTime currentTime = startTime;
    while (currentTime.isBefore(endTime)) {
      final String time =
          '${currentTime.hour.toString().padLeft(2, '0')}:${currentTime.minute.toString().padLeft(2, '0')}';
      if (currentTime.isAfter(now)) {
        timeCells.add(_timeCell(time));
      }
      currentTime = currentTime.add(const Duration(minutes: 30));
    }
    return timeCells;
  }

  // button to change date
  Widget _changeDateButton() {
    return CupertinoButton(
      onPressed: () {
        _showDatePicker(context);
      },
      padding: const EdgeInsets.all(0),
      child: Container(
        height: 60,
        width: 120,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            'Change Date',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  void onCellTap(String time) {
    if (selectedTimes.contains(time)) {
      selectedTimes.remove(time);
    } else {
      selectedTimes.add(time);
    }
  }

  bool isSelectedTime(String time) {
    return selectedTimes.contains(time);
  }

  //showModalBottomSheet date picker, cant select date before now
  void _showDatePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 300,
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedDate;
                  });
                  Navigator.pop(context);
                },
                child: const Text('Done'),
              ),
              Expanded(
                child: CupertinoDatePicker(
                  initialDateTime: DateTime.now(),
                  onDateTimeChanged: (DateTime newDate) {
                    selectedDate = newDate;
                  },
                  minimumDate: DateTime.now()
                      .subtract(const Duration(milliseconds: 200)),
                  maximumDate: DateTime.now().add(const Duration(days: 7)),
                  mode: CupertinoDatePickerMode.date,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
