import 'package:flutter/material.dart';
import 'alarm_add_page.dart';
import '../utilities/alarm_manager_page.dart';
import 'view_alarm_page.dart';


class Alarm {
  final String time;
  final String repeatDays;
  bool isOn; // New property to track alarm status

  Alarm({required this.time, required this.repeatDays, this.isOn = false});
}

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  final List<Alarm> alarms = [
    Alarm(time: '8:00 AM', repeatDays: 'Mon, Wed, Fri'),
    Alarm(time: '9:30 AM', repeatDays: 'Tue, Thu'),
    // Add more alarms as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alarms'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Navigate to the page for creating a new alarm
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddAlarmPage()));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: alarms.length,
        itemBuilder: (context, index) {
          final alarm = alarms[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: InkWell(
                onTap: () {
                  // View alarm details (e.g., navigate to ViewAlarmPage)
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAlarmPage(alarm: alarm)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            alarm.time,
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            alarm.repeatDays,
                            style: TextStyle(fontSize: 14), // Smaller font size for repeat days
                          ),
                        ],
                      ),
                      Switch(
                        value: alarm.isOn,
                        onChanged: (value) {
                          setState(() {
                            alarm.isOn = value; // Toggle alarm status
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


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
            Text('Repeat: ${alarm.repeatDays}'),
          ],
        ),
      ),
    );
  }
}