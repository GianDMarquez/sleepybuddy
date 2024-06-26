import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../widgets/buddy_pressable.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColorDark,
          title: Text('SleepyBuddy',
              style: TextStyle(color: primaryColorGray, fontSize: 24)),
          centerTitle: true,
          leading: Image.asset(
            'assets/images/logo_buddy.png',
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Text("Press me!",
                  style: TextStyle(
                    color: primaryColorGray,
                    fontSize: 48,
                  )
              ),
              const BuddyPressed(),
            ],
          ),
        ));
  }
}
