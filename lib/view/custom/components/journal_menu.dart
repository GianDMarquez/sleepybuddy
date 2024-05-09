import 'package:flutter/material.dart';
import 'package:sleeplist/view/colors.dart';

class JournalPopOverMenu extends StatelessWidget {
    final void Function()? onEditTap; //db?
    final void Function()? onDeleteTap;

  const JournalPopOverMenu({super.key, required this.onEditTap, required this.onDeleteTap});

 @override
 Widget build(BuildContext context) {
  return Column(
    children: [
      //EDIT
      GestureDetector(
        onTap: onEditTap,
        child: Container(
          height:  36,
          color: primaryColorLight,
          child: Center(child: Text("Edit", style: TextStyle(color: primaryColorGray, fontWeight: FontWeight.bold))),
        )
      ),
      //DELETE
      GestureDetector(
        onTap: onDeleteTap,
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