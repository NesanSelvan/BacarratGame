import 'package:baccarat/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:provider/provider.dart';

class GamePoints {
  int TotalPoints(int totalValue, int score2) {
    return (totalValue + score2) % 10;
    // return 5;
  }

  int numericValue(CardValue cardValue) {
    final Map<CardValue, dynamic> points = {
      CardValue.two: 2,
      CardValue.three: 3,
      CardValue.four: 4,
      CardValue.five: 5,
      CardValue.six: 6,
      CardValue.seven: 7,
      CardValue.eight: 8,
      CardValue.nine: 9,
      CardValue.ten: 0,
      CardValue.jack: 0,
      CardValue.queen: 0,
      CardValue.king: 0,
      CardValue.ace: 1
    };
    return points[cardValue];
  }

  void getPoints(
      BuildContext context, CardValue playerPoints, CardValue bankerPoints) {
    final gameprovider = Provider.of<GameProvider>(context, listen: false);

    gameprovider.totalPlayerPoints =
        TotalPoints(gameprovider.totalPlayerPoints, numericValue(playerPoints));
    gameprovider.totalBankerPoints =
        TotalPoints(gameprovider.totalBankerPoints, numericValue(bankerPoints));
    print("total value ${gameprovider.totalBankerPoints}");
  }
}
