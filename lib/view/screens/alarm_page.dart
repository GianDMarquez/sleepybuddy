//lib/screens/alarm_page
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utilities/alarm.dart';
import '../colors.dart';
import 'alarm_add_page.dart';
import '../../utilities/alarm_manager_page.dart';
import 'alarm_details_page.dart';

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  final List<Alarm> alarms = [
    // Add more alarms as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: primaryColorDark, 
        title: Text('Alarms', style: TextStyle(color: primaryColorGray, fontSize: 24)),
        centerTitle: true,
         leading: Image.asset(
                'lib/images/logo_buddy.png', // Replace with your image asset
               // width: 72, // Set the desired width
                //height: 72, // Set the desired height
                //scale: 50
              ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            color: primaryColorGray,
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
                          // Add relevant alarm details here
                        ],
                      ),
                      // Add switch for alarm status here
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
            Text('Repeat: ${alarm.alarmDays}'),
          ],
        ),
      ),
    );
  }
}