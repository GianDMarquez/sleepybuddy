import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../colors.dart';

class ViewJournalEntryPage extends StatefulWidget {
  @override
  _ViewJournalEntryPageState createState() => _ViewJournalEntryPageState();
}

class _ViewJournalEntryPageState extends State<ViewJournalEntryPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //FETCH INFO HERE?
    //id
    //title
    //stuff

    return Scaffold(
      backgroundColor: secondaryColorLight,
      appBar: AppBar(
          iconTheme: IconThemeData(color: primaryColorGray),
          backgroundColor: primaryColorDark,
          title: Text(
            'View Journal Entry',
            style: TextStyle(color: primaryColorGray, fontSize: 24),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  print("====DEBUG=====\n");
                  print("Pressed Save\n");
                  //print("Date: $currentDate\n");
                  //print('Title: $title\n');
                  //print('Content: $content\n');
                  Navigator.pop(context); // Return to the journal page
                }),
          ]),
         body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Date
              Text(
                DateFormat.yMMMMEEEEd().format(DateTime.parse("2024-05-08")),
                style: TextStyle(fontSize: 16, color: primaryColorGray),
              ),
              TextField(
                controller: titleController,
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
      ),// TO-DO
    );
  }
}
