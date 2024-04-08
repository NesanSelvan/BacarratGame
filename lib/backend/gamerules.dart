import 'package:baccarat/dialog/winner.dart';
import 'package:baccarat/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameRules {
  bool drawPlayeCard(
    int playerPoints,
    int bankerpoints,
    BuildContext context,
  ) {
    if (bankerpoints == 9 || bankerpoints == 8) {
      winner(
        context,
      );
      return false;
    } else {
      if (playerPoints <= 5) {
        return true;
      } else if (playerPoints == 9 || playerPoints == 8) {
        winner(context);
        return false;
      } else {
        return false;
      }
    }
  }

  bool drawBankerCard(
    bool isPlayerCardDrawn,
    int playerPoints,
    int bankerPoints,
    int playerThirdCard,
    BuildContext context,
  ) {
    if (isPlayerCardDrawn) {
      if (bankerPoints <= 2) {
        return true;
      } else if (bankerPoints == 3) {
        if (playerThirdCard == 8) {
          return true;
        } else {
          return false;
        }
      } else if (bankerPoints == 4) {
        if (playerThirdCard >= 2 && playerThirdCard <= 7) {
          return true;
        } else {
          return false;
        }
      } else if (bankerPoints == 5) {
        if (playerThirdCard <= 7 && playerThirdCard >= 4) {
          return true;
        } else {
          return false;
        }
      } else if (bankerPoints == 6) {
        if (playerThirdCard <= 7 && playerThirdCard >= 6) {
          return true;
        } else {
          return false;
        }
      }
    } else if (!isPlayerCardDrawn) {
      if (playerPoints >= 7 && playerPoints <= 9) {
        return false;
      }
      {
        if (bankerPoints <= 5) {
          return true;
        } else if (bankerPoints == 8 || bankerPoints == 9) {
          winner(context);
          return false;
        }
      }
    }
    return false;
  }

  void winner(BuildContext context) {
    final gameprovider = Provider.of<GameProvider>(context, listen: false);
    int? playerPoints = gameprovider.totalPlayerPoints;
    int? bankerPoints = gameprovider.totalBankerPoints;
    if (playerPoints > bankerPoints) {
      print("${playerPoints},${bankerPoints}player Won");
      Future.delayed(Duration(milliseconds: 1000), () async {
        WinnerDialog.winner(
          context,
          "Player won",
        ); // Pass custom message
      });
      Future.delayed(Duration(seconds: 3), () {
        // Navigator.popAndPushNamed(context, '/game');
        Navigator.pop(context);
        Navigator.popAndPushNamed(context, "/game");
      });
    } else if (playerPoints == bankerPoints) {
      Future.delayed(Duration(milliseconds: 1000), () async {
        WinnerDialog.winner(
          context,
          "Tie ",
        );
// Pass custom message
      });
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pop(context);
        Navigator.popAndPushNamed(context, '/game');
      });
    } else {
      print("${playerPoints},${bankerPoints}banker Won");
      Future.delayed(Duration(milliseconds: 1000), () {
        WinnerDialog.winner(
          context,
          "banker won",
        );
      });
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pop(context);
        Navigator.popAndPushNamed(context, "/game");
      });
    }
  }

  // Future<void> _showMyDialog(BuildContext context, String txt) async {
  //   return showDialog<void>(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text(
  //           txt,
  //           style: GoogleFonts.openSans(
  //               fontSize: 24,
  //               color: Colors.deepOrange,
  //               fontWeight: FontWeight.w700),
  //         ),
  //         // content: Text(txt), // Customize content as needed
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //               Navigator.pushReplacement(context,
  //                   (MaterialPageRoute(builder: (context) => GameScreen())));
  //             },
  //             child: Text('OK'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
