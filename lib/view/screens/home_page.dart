import 'package:flutter/material.dart';

import '../theme/colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColorDark,
        title: Text('SleepyBuddy',
            style: TextStyle(color: primaryColorGray, fontSize: 24)),
        centerTitle: true,
        leading: Image.asset(
          'lib/images/logo_buddy.png',
        ),
      ),
      body: Center(
        child: InkWell(
             onTap: () {},
             splashColor: primaryColorDark,
              child: Ink.image(
                fit: BoxFit.cover,
                width: 400,
                height: 400,
                image: AssetImage(
                  "lib/images/logo_buddy_pressable.png"
                  //logo_name_n_buddy.png
                  //logo_buddy_pressable.png
                  ),
                ),
              )
        //logo_shortened.png
        //logo_name_n_buddy.png
      ),
    );
  } 
}
