import 'package:baccarat/main.dart';
import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:provider/provider.dart';

class PokerCard {
  ShapeBorder shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(color: Colors.black, width: 1));

  Widget pokerAnimation(double dx, double dy, BuildContext context,
      CardValue cardValue, Suit suitValue) {
    double x = dx;
    double y = dy;
    // Suit randomCard2 = getRandomItem(suits);
    final gameprovider = Provider.of<GameProvider>(context, listen: false);
    return AnimatedPositioned(
      onEnd: () {
        if (gameprovider.callPlayerCard && !gameprovider.globalCallPlayerCard) {
          gameprovider.globalCallPlayerCard = true;
        }
        // Animation is completed
      },
      duration: const Duration(milliseconds: 600),
      top: y,
      left: x,
      child: Container(
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.2,
          color: Colors.transparent,
          child: FlatCardFan(children: [
            PlayingCardView(
                card: PlayingCard(suitValue, cardValue),
                showBack: false,
                elevation: 3.0,
                shape: shape),
            // PlayingCardView(
            //     card: PlayingCard(randomCard2, value2),
            //     showBack: false,
            //     elevation: 3.0,
            //     shape: shape),

            // PlayingCardView(
            //     card: PlayingCard(randomCard3, randomValue3),
            //     showBack: false,
            //     elevation: 3.0,
            //     shape: shape),
          ])),
    );
  }
}
