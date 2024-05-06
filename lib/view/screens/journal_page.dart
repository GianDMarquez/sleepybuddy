//journal testing 2.0
import 'package:flutter/material.dart';

// My Pages and Tiles
import '../colors.dart';
import '../custom/components/journal_tile.dart';
import 'journal_add_page.dart';


class JournalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColorDark, 
        title: Text('Journal Testing', style: TextStyle(color: primaryColorGray)),
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
      body: ListView(
        children: [
          JournalTile(
            createdDate: "May 7, 2024",
            title: "Tutorial",
            textContent: "Welcome to the Journal Page. Please write down any fluttering thoughts before bedtime.",
          ),
           JournalTile(
            createdDate: "May 7, 2024",
            title: "Tutorial",
            textContent: "Welcome to the Journal Page. Please write down any fluttering thoughts before bedtime.",
          ),
        ],
      )
    );
  }
}