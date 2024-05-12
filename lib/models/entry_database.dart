import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'entry.dart';

class EntryDatabase extends ChangeNotifier {
  static late Isar entryDB;

  // Intializie
  static Future<void> initialize() async {
    final directory = await getApplicationDocumentsDirectory();
    entryDB = await Isar.open([EntrySchema], directory: directory.path);
  }

  // create Intial Data
  Future<void> createIntialData() async {
    DateTime initDate = DateTime.now();
    String dummyUsertitle = "Tutorial";
    String dummyUserContent = "Welcome to your Journal! Please write any fluttering thoughts before bedtime.";

    final newEntry = Entry()
      ..createdDate = initDate
      ..title = dummyUsertitle
      ..content = dummyUserContent;

    // Save Entry
    await entryDB.writeTxn(() => entryDB.entrys.put(newEntry));
  }
  // List of Entry
  final List<Entry> currentEntries = [];

  // Create entry, save in database
  Future<void> addEntry(
      DateTime currentDate, String usertitle, String userContent) async {
    // Create Entry
    final newEntry = Entry()
      ..createdDate = currentDate
      ..title = usertitle
      ..content = userContent;

    // Save Entry
    await entryDB.writeTxn(() => entryDB.entrys.put(newEntry));

    // Re-read from the database
    fetchEntries();
  }

  // Read entries in database
  Future<void> fetchEntries() async {
    List<Entry> fetchEntries = await entryDB.entrys.where().findAll();
    currentEntries.clear();
    currentEntries.addAll(fetchEntries);
    notifyListeners(); //notify widgets for changes
  }

  // Update, using id
  //might cause issues idk
  Future<void> updateEntry(
      int entryID, String newTitle, String newContent) async {
    final existingEntry = await entryDB.entrys.get(entryID);
    if (existingEntry != null) {
      existingEntry.title = newTitle; // Update the title
      existingEntry.content = newContent; // Update the content
      await entryDB.writeTxn(() => entryDB.entrys.put(existingEntry));
    }
    await fetchEntries();
  }

  // Delete a Entry
  Future<void> deleteEntry(int entryID) async {
    await entryDB.writeTxn(() => entryDB.entrys.delete(entryID));
    await fetchEntries();
  }

  //Get Entry
  Future<Entry?> getEntryById(int entryID) async {
    final entry = await entryDB.entrys.get(entryID);
    return entry;
  }

}