import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddAlarmPage extends StatefulWidget {
  @override
  _AddAlarmPageState createState() => _AddAlarmPageState();
}

class _AddAlarmPageState extends State<AddAlarmPage> {
  TimeOfDay selectedTime = TimeOfDay.now();
  List<bool> selectedDays = List.generate(7, (index) => false); // Initialize with all days off
  TextEditingController alarmLabelController = TextEditingController(); // Controller for alarm label

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Alarm'),
      ),
      body: SingleChildScrollView( // Wrap the content in a SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Alarm Label', // Moved to the top
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: alarmLabelController,
                decoration: InputDecoration(
                  hintText: 'Enter alarm label', // Default text
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Set Alarm Time',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              GestureDetector( // Make the alarm time text clickable
                onTap: () async {
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
                child: Text(
                  selectedTime.format(context), // Display selected time (larger font)
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Repeat Days',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              for (int i = 0; i < 7; i++)
                CheckboxListTile(
                  title: Text(getDayName(i)),
                  value: selectedDays[i],
                  onChanged: (value) {
                    setState(() {
                      selectedDays[i] = value ?? false;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading, // Reduce spacing
                ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Cancel button action (return to alarm page)
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Save the alarm details to SharedPreferences
                      await saveAlarmToSharedPreferences();

                      // Return to the alarm page
                      Navigator.pop(context);
                    },
                    child: Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to get the day name (e.g., Monday, Tuesday)
  String getDayName(int index) {
    switch (index) {
      case 0:
        return 'Sunday';
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      default:
        return ''; // Invalid, please don't happen
    }
  }

  // Helper function to save the alarm details to SharedPreferences
  Future<void> saveAlarmToSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('alarmTime', selectedTime.format(context));
    final alarmLabel = alarmLabelController.text;
    prefs.setString('alarmLabel', alarmLabel);
  }
}