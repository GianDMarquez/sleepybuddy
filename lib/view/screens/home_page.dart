import 'package:flutter/material.dart';

import '../colors.dart';
import 'package:sleeplist/view/screens/journal_details_page.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColorDark, 
        title: Text('SleepyBuddy', style: TextStyle(color: primaryColorGray)),
        actions: [
        ],
      ),
      body: Text("Hello!", style: TextStyle(color: primaryColorGray))
    );
  }
}
