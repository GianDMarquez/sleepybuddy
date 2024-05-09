import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:sleeplist/view/custom/components/journal_pop_menu.dart';
import 'package:sleeplist/view/screens/journal_edit_page.dart';

import '../../colors.dart';

class JournalTile extends StatelessWidget {
  //final Entry entry?
  final int entryID;
  final String createdDate;
  final String title;
  final String textContent;
  //final String lastEditedDate;

  final void Function()? onTap;
  
  final void Function()? onEditTap;
  final void Function()? onDeleteTap;


  const JournalTile({
    super.key,
    required this.entryID,
    required this.createdDate,
    required this.title,
    required this.textContent,

    required this.onTap,
    required this.onEditTap,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
        child: Container(
          height: 192,
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
                      const EdgeInsets.only(left: 16.0, bottom: 4.0, top: 8.0),
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
                  padding: const EdgeInsets.only(left: 16.0, bottom: 4.0),
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
                            onEditTap: onEditTap, 
                            onDeleteTap: onDeleteTap,
                          )),
                      );
                    }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
