import 'package:baccarat/screens/gamescreen.dart';
import 'package:baccarat/screens/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class WinnerDialog {
  static void winner(BuildContext context, String txt) {
    showGeneralDialog(
        context: context,
        barrierLabel: "Barrier",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        pageBuilder: (_, __, ___) {
          return StatefulBuilder(builder: (context, setState) {
            return Material(
                type: MaterialType.transparency,
                child: Center(
                    child: Container(
                        // color: Colors.red,
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: SelectionArea(
                            child: Scaffold(
                          backgroundColor: Colors
                              .transparent, // Set background color to transparent

                          body: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 4, color: Colors.white),
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.red.shade600),
                              child: Center(
                                  child: Text(
                                txt.toString(),
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700),
                              ))),
                        )))));
          });
        });
  }
}
