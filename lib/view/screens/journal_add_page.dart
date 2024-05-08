import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../colors.dart';

class AddJournalEntryPage extends StatefulWidget {
  @override
  _AddJournalEntryPageState createState() => _AddJournalEntryPageState();
}

class _AddJournalEntryPageState extends State<AddJournalEntryPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

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
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Title',
              ),
              style: TextStyle(fontSize: 24),
              maxLines: null, // Allow multiple lines
            ),
            TextField(
              controller: contentController,
              decoration: InputDecoration(
                hintText: 'Enter your journal entry...',
              ),
              maxLines: null, // Allow multiple lines
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save the journal entry to storage
                String title = titleController.text;
                String content = contentController.text;
                // You can implement this logic here
                // Print the values for debugging
                print("====DEBUG=====\n");
                print("Date: $currentDate\n");
                print('Title: $title\n');
                print('content: $content\n');
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
