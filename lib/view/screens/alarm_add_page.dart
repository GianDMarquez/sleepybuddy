// alarm_add_page.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utilities/alarm.dart';

class AddAlarmPage extends StatefulWidget {
  @override
  _AddAlarmPageState createState() => _AddAlarmPageState();
}

class _AddAlarmPageState extends State<AddAlarmPage> {
  TimeOfDay selectedTime = TimeOfDay.now();
  List<String> selectedDays = List.generate(7, (index) => '0'); // Initialize with 'not selected'
  TextEditingController alarmLabelController = TextEditingController();
  int _nextAlarmId = 2; //change so it changes

  @override
  void initState() {
    super.initState();
    // Retrieve the current number of alarms from shared preferences
    _loadCurrentAlarms();
  }
  Future<void> _loadCurrentAlarms() async {
    final prefs = await SharedPreferences.getInstance();
    // Example: Retrieve the count of existing alarms
    final existingAlarmCount = prefs.getInt('alarmCount') ?? 0;
    // Set _nextAlarmId to the next available ID
    _nextAlarmId = existingAlarmCount + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Alarm'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Alarm Label',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: alarmLabelController,
                decoration: InputDecoration(
                  hintText: 'Enter alarm label',
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Set Alarm Time',
              ),
              SizedBox(height: 8),
              GestureDetector(
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
                  selectedTime.format(context),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ), // Time Text BIG
              ),
              SizedBox(height: 16),
              Text(
                'Repeat Days',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              for (int i = 0; i < 7; i++)
                CheckboxListTile(
                  title: Text(getDayName(i)),
                  value: selectedDays[i] == '1',
                  onChanged: (value) {
                    setState(() {
                      selectedDays[i] = value != null && value ? '1' : '0';
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      print('Current _nextAlarmId: $_nextAlarmId'); // Debug print
                      final newAlarm = Alarm(
                        id: _nextAlarmId,
                        label: alarmLabelController.text,
                        time: selectedTime,
                        alarmDays: selectedDays,
                      );
                      await saveAlarm(newAlarm);
                      Navigator.pop(context);
                      _nextAlarmId++;
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
        return ''; 
    }
  }

  Future<void> saveAlarm(Alarm alarm) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('alarmTime_${alarm.id}', alarm.time.format(context));
    prefs.setString('alarmLabel_${alarm.id}', alarm.label);
    prefs.setStringList('alarmRepeatDays_${alarm.id}', alarm.alarmDays);
    // Example: Update the alarm count
    prefs.setInt('alarmCount', _nextAlarmId);
  }
}