import 'package:flutter/material.dart';

import '../../colors.dart';

class JournalTile extends StatelessWidget {
  //final int entryID;
  final String createdDate;
  final String title;
  final String textContent;
  //final String lastEditedDate;
//change back to const
  JournalTile({
    //required this.entryID,
    super.key,
    required this.createdDate,
    required this.title,
    //this.content = " ",
    required this.textContent,
    //required this.lastEditedDate
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: 
        Card(
          color: secondaryColorLight,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0, top: 8.0),
                child: Text(
                  createdDate,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
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
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                  textContent,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
    );
  }
}
