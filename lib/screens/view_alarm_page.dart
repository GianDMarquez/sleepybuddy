// view_alarm_page.dart

import 'package:flutter/material.dart';
import '../utilities/alarm_manager_page.dart';

class ViewAlarmPage extends StatelessWidget {
  final int alarmId; // Pass the alarm ID from the selected alarm

  ViewAlarmPage({required this.alarmId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Alarm'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Alarm Details', style: TextStyle(fontSize: 24)),
            // Display additional alarm properties (e.g., alarm name, snooze settings)
            ElevatedButton(
              onPressed: () {
                // Cancel the alarm
                AlarmManager.cancelAlarm(alarmId);
                Navigator.pop(context); // Return to the alarm page
              },
              child: Text('Cancel Alarm'),
            ),
          ],
        ),
      ),
    );
  }
}
