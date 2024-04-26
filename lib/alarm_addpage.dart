import 'package:flutter/material.dart';

class AddAlarmPage extends StatefulWidget {
  @override
  _AddAlarmPageState createState() => _AddAlarmPageState();
}

class _AddAlarmPageState extends State<AddAlarmPage> {
  TimeOfDay selectedTime = TimeOfDay.now();
  bool isMonday = false;
  bool isTuesday = false;
  bool isWednesday = false;
  bool isThursday = false;
  bool isFriday = false;
  bool isSaturday = false;
  bool isSunday = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Alarm'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Set Alarm Time',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                final pickedTime = await showTimePicker(
                  context: context,
                  initialTime: selectedTime,
                );
                if (pickedTime != null && pickedTime != selectedTime) {
                  setState(() {
                    selectedTime = pickedTime;
                  });
                }
              },
              child: Text('Select Time'),
            ),
            SizedBox(height: 16),
            Text(
              'Repeat Days',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: Text('Monday'),
              value: isMonday,
              onChanged: (value) {
                setState(() {
                  isMonday = value ?? false; // Ensure non-nullable value
                });
              },
            ),
            // Add checkboxes for other days (Tuesday, Wednesday, etc.)
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save the alarm details to storage
                Navigator.pop(context); // Return to the alarm page
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}