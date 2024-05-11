import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


import '../../models/entry.dart';
import '../../models/entry_database.dart';
import '../colors.dart';

class EditJournalEntryPage extends StatefulWidget {
  final Entry entry;
  EditJournalEntryPage({required this.entry});

  @override
  _EditJournalEntryPage createState() => _EditJournalEntryPage();
}

class _EditJournalEntryPage extends State<EditJournalEntryPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //prefill the text
    titleController.text = widget.entry.title;
    contentController.text = widget.entry.content;

    //id
    int entryID = widget.entry.entryID;
    //date
    DateTime displayedDate = widget.entry.createdDate;
    return Scaffold(
      backgroundColor: secondaryColorLight,
      appBar: AppBar(
          iconTheme: IconThemeData(color: primaryColorGray),
          backgroundColor: primaryColorDark,
          title: Text(
            //debugging for now
            'Edit Journal Entry ${widget.entry.entryID}',
            style: TextStyle(color: primaryColorGray, fontSize: 24),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  context
                  .read<EntryDatabase>()
                  .updateEntry(
                      entryID, titleController.text, contentController.text);
                  //clear controllers
                  titleController.clear();
                  contentController.clear();
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
                DateFormat.yMMMMEEEEd().format(displayedDate),
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
