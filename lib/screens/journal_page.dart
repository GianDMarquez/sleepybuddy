import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'journal_add_page.dart';
import 'journal_view_page.dart';
class JournalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Journal'), 
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Navigate to the page for creating a new journal entry
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddJournalEntryPage()));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 5, // Replace with the actual number of journal entries
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: InkWell(
                onTap: () {
                  // Navigate to the page for viewing/editing the journal entry
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewJournalEntryPage()));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'May 12, 2024', // Replace with the actual date
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(), // Add a horizontal line
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Journal Entry Title', // Replace with the actual title
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac justo nec odio bibendum tincidunt.',
                        maxLines: 2, 
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


