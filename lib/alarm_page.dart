import 'package:flutter/material.dart';

class AlarmPage extends StatelessWidget {
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
        itemCount: 5, // Replace with the actual number of alarms
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: InkWell(
                onTap: () {
                  // View alarm details (e.g., time, repeat days)
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAlarmPage()));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        '8:00 AM', // Replace with the actual alarm time
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(), // Add a horizontal line
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Alarm Name', // Replace with the actual alarm name
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Repeat: Mon, Wed, Fri', // Replace with the actual repeat days
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AddAlarmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Alarm'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Add UI elements for setting alarm time, repeat days, etc.
            // You can use TimePicker, CheckboxListTile, etc.
            // Implement logic to save the alarm details to storage.
            // Example:
            // TimePickerFormField(
            //   // Set alarm time
            //   onChanged: (time) {
            //     // Save the selected time
            //   },
            // ),
            // CheckboxListTile(
            //   // Set repeat days
            //   onChanged: (value) {
            //     // Save the selected repeat days
            //   },
            // ),
            ElevatedButton(
              onPressed: () {
                // Save the alarm details to storage
                // You can implement this logic here
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

class ViewAlarmPage extends StatelessWidget {
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
            Text('Alarm Name', style: TextStyle(fontSize: 24)),
            // Display alarm details (e.g., time, repeat days)
            // You can retrieve the alarm details from storage.
            // Example:
            // Text('Alarm Time: 8:00 AM'),
            // Text('Repeat: Mon, Wed, Fri'),
          ],
        ),
      ),
    );
  }
}
