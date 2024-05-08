import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sleeplist/models/entry.dart';
import 'package:sleeplist/models/entry_database.dart';

// My Pages and Tiles
import '../colors.dart';
import '../custom/components/journal_tile.dart';
import 'journal_add_page.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});
  
  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State <JournalPage> {
  // List of Journal
  List journalEntries = [
    [
      "May 7, 2024",
      "Tutorial",
      "Welcome to the Journal Page. Please write down any fluttering thoughts before bedtime."
    ],
    ["May 13, 2024", "That's a long string!", "Today was a beautiful day filled with moments of joy and reflection. I woke up early to the sound of birds chirping outside my window, a gentle reminder that a new day had begun."]
  ];
  
  @override
  void initState() {
    super.initState();

    //TO-DO: Intialize Database
    // first start-up...

    //onapp start up fetch existing entry
    readEntries();
  }
  // Create -> Journal Add Page
  
  // Read
  void readEntries() {
    context.read<EntryDatabase>().fetchEntries();
  }
  // Update

  // Delete

  @override
  Widget build(BuildContext context) {
    //Journal Database
    final entryDatabase = context.watch<EntryDatabase>();

    // List of Journal Entries
     final List<Entry> currentEntries = entryDatabase.currentEntries;

    return Scaffold(
        //TO DO: APP BAr Context
        appBar: AppBar(
          backgroundColor: primaryColorDark,
          title: Text('Journal', style: TextStyle(color: primaryColorGray, fontSize: 24)),
          centerTitle: true,
          leading: Image.asset(
            'lib/images/logo_buddy.png', //idk
            // width: 72, // Set the desired width
            //height: 72, // Set the desired height
            //scale: 50
          ),
          actions: [
            IconButton(
              color: primaryColorGray,
              icon: Icon(Icons.add),
              onPressed: () {
                // Navigate to the page for creating a new journal entry
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddJournalEntryPage()));
              },
            ),
          ],
        ),
        //List -> Holding Journal Tiles
        body: ListView.builder(
          //he made a tutorial
          itemCount: currentEntries.length,
          itemBuilder: (context, index) {
            final entry = currentEntries[index];

            return JournalTile(
              createdDate: DateFormat('MMMM, d yyyy').format(entry.createdDate),
              title: entry.title,
              textContent: entry.content,
            );
          },
        ));
  }
}
