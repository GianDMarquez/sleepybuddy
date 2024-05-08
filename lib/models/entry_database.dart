import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sleeplist/models/entry.dart';

// TO-DO: Only changing text, we need more
class EntryDatabse extends ChangeNotifier {
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
  Future<void> addEntry(String contentFromUser) async {
    // Create Entry
    final newEntry = Entry()..content = contentFromUser;

    // Save Entry
    await isar.writeTxn(() => isar.entrys.put(newEntry));

    // re-read from db
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
    Future<void> updateEntry(int entryID, String newContent) async {
      final existingEntry = await isar.entrys.get(entryID);
      if (existingEntry != null) {
        existingEntry.content = newContent;
        await isar.writeTxn(() => isar.entrys.put(existingEntry));
      }
    }

    // Delete a Entry
    Future<void> deleteEntry(int entryID) async {
      await isar.writeTxn(() => isar.entrys.delete(entryID));
      await fetchEntries();
    }
}
