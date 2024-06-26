import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/entry_database.dart';
import '../theme/colors.dart';

class AddJournalEntryPage extends StatefulWidget {
  const AddJournalEntryPage({super.key});

  @override

   State<AddJournalEntryPage> createState() => _AddJournalEntryPageState();
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
            icon: const Icon(Icons.save),
            onPressed: () {
              // Save the journal entry to storage
              context.read<EntryDatabase>().addEntry(currentDate, titleController.text, contentController.text);
              //clear controllers 
              titleController.clear();
              contentController.clear();
              Navigator.pop(context); // Return to the journal page
              // TO-DO: Some kind of popup dialog to show that it actually added?
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
                decoration: const InputDecoration(
                  hintText: 'Title',
                ),
                style: const TextStyle(fontSize: 24),
                maxLines: 1,
                maxLength: 32,
              ),
              TextField(
                controller: contentController,
                decoration: const InputDecoration(
                  hintText: 'Enter your journal entry...',
                ),
                style: const TextStyle(fontSize: 14),
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}