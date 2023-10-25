import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CreateMeetingScreen extends StatelessWidget {
  const CreateMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Meeting'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                AutoRouter.of(context).pop();
              },
              child: const Text(
                'back',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
