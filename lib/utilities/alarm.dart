import 'package:flutter/material.dart';

class Alarm {
  final int id; // Unique identifier for the alarm
  final String label;
  final TimeOfDay time;
  final List<String> alarmDays;

  Alarm({
    required this.id,
    required this.label,
    required this.time,
    required this.alarmDays,
  });
}

List<bool> convertStringsToBooleans(List<String> stringList) {
  // Converts a list of strings ('0' or '1') to a list of booleans.
  return stringList.map((s) => s == '1').toList();
}
