import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
//to be deleted

// My Pages and Tiles
import '../colors.dart';
import '../custom/components/journal_tile.dart';
import 'journal_add_page.dart';
import 'package:sleeplist/view/screens/journal_edit_page.dart';
import 'package:sleeplist/models/entry.dart';
import 'package:sleeplist/models/entry_database.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {

  @override
  void initState() {
    super.initState();

    //TO-DO: Intialize Database
    //if empty
    //Create Base?
    // first start-up...

    //onapp start up fetch existing entry
    readEntries();
  }
  // Create -> Journal Add Page

  // Read
  void readEntries() {
    context.read<EntryDatabase>().fetchEntries();
  }

  // navigate to notes journal page
void navigateToJournalDetails(int index) async {
  final editEntry = await context.read<EntryDatabase>().getEntryById(index);
  if (editEntry != null) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditJournalEntryPage(entry: editEntry),
      ),
    );
  } else {
    // Handle the case where the entry with the specified index is not found
    print('Entry not found for index $index');
  }
}

  // Update
  void updateEntry(int entryIdToRetrieve) async {
    navigateToJournalDetails(entryIdToRetrieve);
  }

  // Delete
  deleteEntryByID(int entryID) {
    context.read<EntryDatabase>().deleteEntry(entryID);
  }

  // Get Entry
  //prob deleted?
  void getEntry(int entryIdToRetrieve) async {
    final entry =
        await context.read<EntryDatabase>().getEntryById(entryIdToRetrieve);
  }

  @override
  Widget build(BuildContext context) {
    //Journal Database
    final entryDatabase = context.watch<EntryDatabase>();

    // List of Journal Entries
    final List<Entry> currentEntries = entryDatabase.currentEntries;
    currentEntries.sort((a, b) => b.createdDate.compareTo(a.createdDate));

    return Scaffold(
        //TO DO: APP BAr Context
        appBar: AppBar(
          backgroundColor: primaryColorDark,
          title: Text('Journal',
              style: TextStyle(color: primaryColorGray, fontSize: 24)),
          centerTitle: true,
          leading: Image.asset(
            'lib/images/logo_buddy.png',
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
              entryID: entry.entryID,
              createdDate: DateFormat('EEEE, MMMM d, y HH:mm').format(entry.createdDate),
              title: entry.title,
              textContent: entry.content,
              onTap: () => updateEntry(entry.entryID),
              onEditTap: () => updateEntry(entry.entryID),
              onDeleteTap: () => deleteEntryByID(entry.entryID),
            );
          },
        ));
  }
}
