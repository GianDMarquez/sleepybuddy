// view_alarm_page.dart

import 'package:flutter/material.dart';
import '../../utilities/alarm_manager_page.dart';
import '../../utilities/alarm.dart';

class ViewAlarmPage extends StatelessWidget {
  final Alarm alarm;

  ViewAlarmPage({required this.alarm});

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
            Text('Alarm Time: ${alarm.time}', style: TextStyle(fontSize: 24)),
            Text('Repeat: ${alarm.alarmDays}'),
          ],
        ),
      ),
    );
  }
}