import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sleeplist/models/entry_database.dart';

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
        backgroundColor: primaryColorDark,
        title: Text(
          'Add Journal Entry',
          style: TextStyle(color: primaryColorGray, fontSize: 24),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              // Save the journal entry to storage
              // CREATE ENTRY - DB

              String title = titleController.text;
              String content = contentController.text;
              // Print the values for debugging
              /*print("====DEBUG=====\n");
              print("Date: $currentDate\n");
              print('Title: $title\n');
              print('Content: $content\n');
              */
              context.read<EntryDatabase>().addEntry(currentDate, title, content);
              //clear controllers 
              titleController.clear();
              contentController.clear();
              Navigator.pop(context); // Return to the journal page
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Date
              Text(
                DateFormat.yMMMMEEEEd().format(currentDate),
                style: TextStyle(fontSize: 16, color: primaryColorGray),
              ),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Title',
                ),
                style: TextStyle(fontSize: 24),
                maxLines: 1,
                maxLength: 32,
              ),
              TextField(
                controller: contentController,
                decoration: InputDecoration(
                  hintText: 'Enter your journal entry...',
                ),
                style: TextStyle(fontSize: 14),
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
