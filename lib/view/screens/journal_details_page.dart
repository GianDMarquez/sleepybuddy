import 'package:flutter/material.dart';
//import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ViewJournalEntryPage extends StatefulWidget {
  @override
  _ViewJournalEntryPageState createState() => _ViewJournalEntryPageState();
}

//When u hit the plus button
class _ViewJournalEntryPageState extends State<ViewJournalEntryPage> {
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