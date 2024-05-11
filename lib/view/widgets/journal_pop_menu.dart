import 'package:flutter/material.dart';

import '../colors.dart';

class JournalPopOverMenu extends StatelessWidget {
    final void Function()? onEditTap; 
    final void Function()? onDeleteTap;

  const JournalPopOverMenu({super.key, required this.onEditTap, required this.onDeleteTap});

 @override
 Widget build(BuildContext context) {
  return Column(
    children: [
      //EDIT
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
          onEditTap!();
        },
        child: Container(
          height:  36,
          color: primaryColorLight,
          child: Center(child: Text("Edit", style: TextStyle(color: primaryColorGray, fontWeight: FontWeight.bold))),
        )
      ),
      //DELETE
      GestureDetector(
        onTap: () {
           Navigator.pop(context);
          onDeleteTap!();
        },
        child: Container(
          height:  36,
          color: primaryColorLight,
          child: Center(child: Text("Delete", style: TextStyle(color: primaryColorGray, fontWeight: FontWeight.bold))),
        )
      )
    ],
  );
 }
}