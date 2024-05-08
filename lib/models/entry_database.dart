import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sleeplist/models/entry.dart';

class EntryDatabase extends ChangeNotifier {
  static late Isar isar;
  //do I change to future?

  // Intializie
  static Future<void> initialize() async {
    final directory = await getApplicationDocumentsDirectory();
    isar = await Isar.open([EntrySchema], directory: directory.path);
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
    await isar.writeTxn(() => isar.entrys.put(newEntry));

    // Re-read from the database
    fetchEntries();
  }

  // Read entries in database
  Future<void> fetchEntries() async {
    List<Entry> fetchEntries = await isar.entrys.where().findAll();
    currentEntries.clear();
    currentEntries.addAll(fetchEntries);
    notifyListeners(); //notify widgets for changes
  }

  // Update, using id
  //might cause issues idk
  Future<void> updateEntry(
      int entryID, String newTitle, String newContent) async {
    final existingEntry = await isar.entrys.get(entryID);
    if (existingEntry != null) {
      existingEntry.title = newTitle; // Update the title
      existingEntry.content = newContent; // Update the content
      await isar.writeTxn(() => isar.entrys.put(existingEntry));
    }
  }

  // Delete a Entry
  Future<void> deleteEntry(int entryID) async {
    await isar.writeTxn(() => isar.entrys.delete(entryID));
    await fetchEntries();
  }
}
