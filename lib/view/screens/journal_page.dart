import 'package:flutter/material.dart';

// My Pages and Tiles
import '../colors.dart';
import '../custom/components/journal_tile.dart';
import 'journal_add_page.dart';

class JournalPage extends StatelessWidget {
  // List of Journal
  // Issues: Need to order! + Add Hive/Isar DB
  List journalEntries = [
    [
      "May 7, 2024",
      "Tutorial",
      "Welcome to the Journal Page. Please write down any fluttering thoughts before bedtime."
    ],
    ["May 13, 2024", "That's a long string!", "Today was a beautiful day filled with moments of joy and reflection. I woke up early to the sound of birds chirping outside my window, a gentle reminder that a new day had begun."]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //TO DO: APP BAr Context
        appBar: AppBar(
          backgroundColor: primaryColorDark,
          title: Text('Journal', style: TextStyle(color: primaryColorGray)),
          centerTitle: true,
          leading: Image.asset(
            'lib/images/logo_shortened.png', //idk
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
          itemCount: journalEntries.length,
          itemBuilder: (context, index) {
            return JournalTile(
              createdDate: journalEntries[index][0],
              title: journalEntries[index][1],
              textContent: journalEntries[index][2],
            );
          },
        ));
  }
}
