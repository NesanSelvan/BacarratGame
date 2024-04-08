import 'package:baccarat/screens/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Menudialog {
  static void menu(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierLabel: "Barrier",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 500),
        pageBuilder: (_, __, ___) {
          return StatefulBuilder(builder: (context, setState) {
            return Material(
                type: MaterialType.transparency,
                child: Center(
                    child: TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0.0, end: 1.0),
                        duration: Duration(milliseconds: 500),
                        builder: (_, double opacity, child) {
                          return Opacity(
                              opacity: opacity,
                              child: Container(
                                  // color: Colors.red,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: SelectionArea(
                                      child: Scaffold(
                                    backgroundColor: Colors
                                        .transparent, // Set background color to transparent

                                    body: Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 4, color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: Colors.amber.shade600),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.popAndPushNamed(
                                                  context, "/game");
                                            },
                                            child: Container(
                                              height: 50,
                                              width: 200,
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  border: Border.all(
                                                      width: 4,
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Center(
                                                  child: Text(
                                                "Resume",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              )),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomeScreen()));
                                              setState() {}
                                            },
                                            child: Container(
                                              height: 50,
                                              width: 200,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 4,
                                                      color: Colors.white),
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Center(
                                                  child: Text(
                                                "Exit",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              )),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ))));
                        })));
          });
        });
  }
}
