import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../colors.dart';

class AddJournalEntryPage extends StatefulWidget {
  @override
  _AddJournalEntryPageState createState() => _AddJournalEntryPageState();
}

class _AddJournalEntryPageState extends State<AddJournalEntryPage> {
  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();

    return Scaffold(
      backgroundColor: secondaryColorLight,
      appBar: AppBar(
        iconTheme: IconThemeData(color: primaryColorGray),
        backgroundColor:
            primaryColorDark, //changes top bar color, primaryColorDark
        title: Text('Add Journal Entry',
            style: TextStyle(color: primaryColorGray, fontSize: 24)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Date
            Text(
              '${DateFormat.yMMMMEEEEd().format(currentDate)}',
              style: TextStyle(fontSize: 12, color: primaryColorGray),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Title',
              ),
              style: TextStyle(fontSize: 24),
              maxLines: null, // Allow multiple lines
            ),
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
