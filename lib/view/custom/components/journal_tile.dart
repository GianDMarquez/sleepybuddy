import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:sleeplist/view/custom/components/journal_menu.dart';
import 'package:sleeplist/view/screens/journal_details_page.dart';

import '../../colors.dart';

class JournalTile extends StatelessWidget {
  //final Entry entry?
  //final int entryID;
  final String createdDate;
  final String title;
  final String textContent;
  //final String lastEditedDate;

  final void Function()? onTap;

  final void Function()? onDeletePressed;

  const JournalTile({
    //required this.entryID,
    super.key,
    required this.createdDate,
    required this.title,
    //this.content = " ",
    required this.textContent,
    //required this.lastEditedDate
    required this.onTap,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
      void navigateToJournalDetails() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ViewJournalEntryPage()));
  }

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
        child: Card(
          color: secondaryColorLight,
          elevation: 8,
          shadowColor: primaryColorLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, bottom: 8.0, top: 8.0),
                child: Text(
                  createdDate,
                  style: TextStyle(
                    fontSize: 24,
                    color: primaryColorGray,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(color: primaryColorLight),
              // Title
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Content
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  textContent,
                  style: TextStyle(
                    fontSize: 14,
                    // TO DO: Decide on color for text
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Builder(
                  builder: (context) {
                    return IconButton(
                      icon: const Icon(Icons.more_vert),
                      color: primaryColorGray,
                      onPressed: () => showPopover(
                        width: 120,
                        height: 72, 
                        context: context, 
                        bodyBuilder: (context) => JournalPopOverMenu(
                          onEditTap: navigateToJournalDetails, 
                          onDeleteTap: onDeletePressed,
                        )),
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
