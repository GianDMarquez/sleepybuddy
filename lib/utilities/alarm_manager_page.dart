//alarm_manager_page.dart

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

class AlarmManager {
  static Future<void> setAlarm(Duration delay, int alarmId) async {
    final now = DateTime.now();
    final alarmTime = now.add(delay); // Calculate the alarm time

    await AndroidAlarmManager.oneShot(
      alarmTime.difference(now), // Use the duration between now and alarmTime
      alarmId,
      _handleAlarmCallback,
      exact: true,
      wakeup: true,
      rescheduleOnReboot: true,
    );
  }

  static Future<void> cancelAlarm(int alarmId) async {
    await AndroidAlarmManager.cancel(alarmId);
  }

  static void _handleAlarmCallback(int alarmId) {
    // Handle alarm trigger (e.g., show not`ification, play sound)
    print('Alarm triggered with ID: $alarmId');
  }
}
