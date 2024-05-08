import 'package:flutter/material.dart';

import '../colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColorDark,
          title: Text('SleepyBuddy', style: TextStyle(color: primaryColorGray, fontSize: 24)), centerTitle: true,
          leading: Image.asset(
                'lib/images/logo_buddy.png', // Replace with your image asset
               // width: 72, // Set the desired width
                //height: 72, // Set the desired height
                //scale: 50
              ),
              actions: [
              Image.asset(
                'lib/images/logo_shortened.png', 
              )
              ]
        ),
        body: Text("Hello!", style: TextStyle(color: primaryColorGray)));
  }
}