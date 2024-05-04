import 'package:flutter/material.dart';
//import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddJournalEntryPage extends StatefulWidget {
  @override
  _AddJournalEntryPageState createState() => _AddJournalEntryPageState();
}

//When u hit the plus button
class _AddJournalEntryPageState extends State<AddJournalEntryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Journal Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your journal entry...',
              ),
              maxLines: null, // Allow multiple lines
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save the journal entry to storage
                // You can implement this logic here
                Navigator.pop(context); // Return to the journal page
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}


