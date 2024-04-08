import 'package:baccarat/backend/gamepoints.dart';
import 'package:baccarat/backend/gamerules.dart';
import 'package:baccarat/backend/randomvalue.dart';
import 'package:baccarat/main.dart';
import 'package:baccarat/widgets/pokercard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardPosition extends StatefulWidget {
  const CardPosition({super.key});

  @override
  State<CardPosition> createState() => _CardPositionState();
}

final GlobalKey<ScaffoldState> playerKey = GlobalKey<ScaffoldState>();
final GlobalKey<ScaffoldState> bankerKey = GlobalKey<ScaffoldState>();
RandomValue randomValue = RandomValue();

class _CardPositionState extends State<CardPosition> {
  List<GlobalKey> key = [GlobalKey(), GlobalKey()];
  double x = 150;
  double y = 0;
  PokerCard pokerCard = PokerCard();
  bool secondCard = false;
  Future<void> _updateScore() async {
    final gameprovider = Provider.of<GameProvider>(context, listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int updatedValue = gameprovider.addTotalAmount();
    int? storedValue = await prefs.getInt('score');
    setState(() async {
      if (storedValue != null) {
        storedValue = storedValue! - updatedValue;
        await prefs.setInt("score", storedValue!);
        print("score : $storedValue");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, state, _) {
        return Column(children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.36,
              // color: Colors.red,
              child: Stack(
                children: [
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.03,
                    left: MediaQuery.of(context).size.width * 0.2,
                    child: Container(
                      // height: 40, width: 50,
                      decoration: BoxDecoration(
                          color: Colors.orange.shade400,
                          borderRadius: BorderRadius.circular(25)),
                      // height: MediaQuery.of(context).size.height * 0.04,
                      // width: MediaQuery.of(context).size.width * 0.13,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 4),
                        child: Center(
                          child: state.totalPlayerPoints == null
                              ? Text("")
                              : Text(
                                  state.totalPlayerPoints.toString(),
                                  style: GoogleFonts.poppins(
                                      fontSize: 26 /
                                          896 *
                                          MediaQuery.of(context).size.height,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.03,
                    left: MediaQuery.of(context).size.width * 0.7,
                    child: Container(
                      // height: MediaQuery.of(context).size.height * 0.05,
                      // width: MediaQuery.of(context).size.width * 0.05,

                      decoration: BoxDecoration(
                          color: Colors.orange.shade400,
                          borderRadius: BorderRadius.circular(25)),
                      // height: MediaQuery.of(context).size.height * 0.04,
                      // width: MediaQuery.of(context).size.width * 0.13,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 4),
                        child: Center(
                          child: state.bankerCardPosition == null
                              ? Text("")
                              : Text(
                                  state.totalBankerPoints.toString(),
                                  style: GoogleFonts.poppins(
                                      fontSize: 26 /
                                          896 *
                                          MediaQuery.of(context).size.height,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.06,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.035),
                      child: Container(
                        // color: Colors.red,
                        child: Row(children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width * 0.5,
                            key: playerKey,
                            // color: Colors.white,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 46, 84, 109),
                                border: BorderDirectional(
                                    top: BorderSide(
                                        width: 7, color: Colors.white),
                                    bottom: BorderSide(
                                        width: 7, color: Colors.white),
                                    end: BorderSide(
                                        width: 3.5, color: Colors.white))),
                            child: Center(
                              child: Text(
                                "Player".toUpperCase(),
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 26 /
                                        896 *
                                        MediaQuery.of(context).size.height,
                                    letterSpacing: 2,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            key: bankerKey,
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width * 0.5,
                            // color: Colors.white,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 46, 84, 109),
                                border: BorderDirectional(
                                    top: BorderSide(
                                        width: 7, color: Colors.white),
                                    bottom: BorderSide(
                                        width: 7, color: Colors.white),
                                    start: BorderSide(
                                        width: 3.5, color: Colors.white))),
                            child: Center(
                                child: Text(
                              "Banker".toUpperCase(),
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 26 /
                                      896 *
                                      MediaQuery.of(context).size.height,
                                  letterSpacing: 2,
                                  color: Colors.white),
                            )),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  pokerCard.pokerAnimation(
                    state.playerCardPosition[0].dx == 500
                        ? MediaQuery.of(context).size.width
                        : MediaQuery.of(context).size.width * 0.02,
                    state.playerCardPosition[0].dy,
                    context,
                    state.playerCardValue.isNotEmpty
                        ? state.playerCardValue[0]
                        : CardValue.eight,
                    state.playerCardType.isNotEmpty
                        ? state.playerCardType[0]
                        : Suit.clubs,
                  ),
                  pokerCard.pokerAnimation(
                    state.bankerCardPosition[0].dx == 500
                        ? MediaQuery.of(context).size.width
                        : MediaQuery.of(context).size.width * 0.58 - 20,
                    state.bankerCardPosition[0].dy,
                    context,
                    state.bankerCardValue.isNotEmpty
                        ? state.bankerCardValue[0]
                        : CardValue.eight,
                    state.bankerCardType.isNotEmpty
                        ? state.bankerCardType[0]
                        : Suit.clubs,
                  ),
                  pokerCard.pokerAnimation(
                    (state.playerCardPosition[1].dx == 500
                        ? MediaQuery.of(context).size.width
                        : MediaQuery.of(context).size.width * 0.02 + 50),
                    state.playerCardPosition[1].dy,
                    context,
                    state.playerCardValue.isNotEmpty
                        ? state.playerCardValue[1]
                        : CardValue.eight,
                    state.playerCardType.isNotEmpty
                        ? state.playerCardType[1]
                        : Suit.clubs,
                  ),
                  pokerCard.pokerAnimation(
                    (state.bankerCardPosition[1].dx == 500
                        ? MediaQuery.of(context).size.width
                        : MediaQuery.of(context).size.width * 0.58 + 30),
                    state.bankerCardPosition[1].dy,
                    context,
                    state.bankerCardValue.isNotEmpty
                        ? state.bankerCardValue[1]
                        : CardValue.eight,
                    state.bankerCardType.isNotEmpty
                        ? state.bankerCardType[1]
                        : Suit.clubs,
                  ),
                  pokerCard.pokerAnimation(
                    (state.playerCardPosition[2].dx == 500
                        ? MediaQuery.of(context).size.width
                        : MediaQuery.of(context).size.width * 0.02 + 100),
                    state.playerCardPosition[2].dy,
                    context,
                    state.playerCardValue.isNotEmpty
                        ? state.playerCardValue[2]
                        : CardValue.eight,
                    state.playerCardType.isNotEmpty
                        ? state.playerCardType[2]
                        : Suit.clubs,
                  ),
                  pokerCard.pokerAnimation(
                    (state.bankerCardPosition[2].dx == 500
                        ? MediaQuery.of(context).size.width
                        : MediaQuery.of(context).size.width * 0.58 + 100),
                    state.bankerCardPosition[2].dy,
                    context,
                    state.bankerCardValue.isNotEmpty
                        ? state.bankerCardValue[2]
                        : CardValue.eight,
                    state.bankerCardType.isNotEmpty
                        ? state.bankerCardType[2]
                        : Suit.clubs,
                  )
                ],
              )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  animationDuration: const Duration(milliseconds: 400),
                  shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(32.0),
                  )),
              onPressed: () async {
                if (!state.coinsWidget.isEmpty) {
                  state.playerCoins -= state.addTotalAmount();
                  state.isdeal = true;
                  state.playerCardPosition[0] =
                      state.getPosition(playerKey, "player")!;
                  state.bankerCardPosition[0] =
                      state.getPosition(bankerKey, "banker")!;
                  for (int i = 0; i <= 2; i++) {
                    state.playerCardValue.add(randomValue.getRandomValue());
                    state.bankerCardValue.add(randomValue.getRandomValue());
                    state.playerCardType.add(randomValue.getRandomItem());
                    state.bankerCardType.add(randomValue.getRandomItem());
                  }
                  print("banker value${state.callPlayerCard.toString()}");

                  GamePoints().getPoints(context as BuildContext,
                      state.playerCardValue[0], state.bankerCardValue[0]);
                  setState(() {});

                  await Future.delayed(Duration(seconds: 1));
                  setState(() {});
                  GamePoints().getPoints(context as BuildContext,
                      state.playerCardValue[1], state.bankerCardValue[1]);
                  state.playerCardPosition[1] =
                      state.getPosition(playerKey, "player")!;
                  state.bankerCardPosition[1] =
                      state.getPosition(bankerKey, "banker")!;
                  await Future.delayed(Duration(seconds: 1));
                  setState(() {});
                  state.callPlayerCard = GameRules().drawPlayeCard(
                      state.totalPlayerPoints,
                      state.totalBankerPoints,
                      context);
                  state.callPlayerCard
                      ? GamePoints().getPoints(context as BuildContext,
                          state.playerCardValue[2], CardValue.ten)
                      : null;
                  state.callPlayerCard
                      ? state.playerCardPosition[2] =
                          state.getPosition(playerKey, "player")!
                      : null;

                  state.callBankerCard = GameRules().drawBankerCard(
                      state.callPlayerCard,
                      state.totalPlayerPoints,
                      state.totalBankerPoints,
                      GamePoints().numericValue(state.playerCardValue[2]),
                      context);

                  state.callBankerCard
                      ? state.bankerCardPosition[2] =
                          state.getPosition(bankerKey, "banker")!
                      : null;
                  state.callBankerCard
                      ? GamePoints().getPoints(
                          context as BuildContext,
                          CardValue.ten,
                          state.bankerCardValue[2],
                        )
                      : null;
                  _updateScore();
                  GameRules().winner(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(milliseconds: 1200),
                      backgroundColor: Colors.red,
                      content: Text("Place Bet to make a deal")));
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Deal".toUpperCase(),
                  style: GoogleFonts.poppins(
                      fontSize: 26 / 896 * MediaQuery.of(context).size.height,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
                      color: Colors.white),
                ),
              )),
        ]);
      },
    );
  }
}
