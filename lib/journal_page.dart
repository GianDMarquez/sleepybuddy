import 'package:flutter/material.dart';

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
        itemCount: 5, // fake data
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('Journal Entry $index'),
              subtitle: Text('Date: ${DateTime.now().toString()}'), // Replace with actual date
              onTap: () {
                // Navigate to the page for viewing/editing the journal entry
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewJournalEntryPage()));
              },
            ),
          );
        },
      ),
    );
  }
}

//When u hit the plus button
class AddJournalEntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Journal Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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

class ViewJournalEntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Journal Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Journal Entry Title', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text('Journal entry content goes here...'),
          ],
        ),
      ),
    );
  }
}
