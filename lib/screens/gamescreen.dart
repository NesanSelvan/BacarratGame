import 'package:baccarat/dialog/menu.dart';
import 'package:baccarat/main.dart';
import 'package:baccarat/widgets/card_position.dart';
import 'package:baccarat/widgets/coin_position.dart';
import 'package:baccarat/widgets/floatingcoin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  void Calculatecoins() {
    final gameprovider = Provider.of<GameProvider>(context, listen: false);
    gameprovider.playerCoins -= gameprovider.addTotalAmount();
    setState(() {});
  }

  int? score = 1000;

  @override
  void initState() {
    super.initState();
    _initializeScore();
  }

  void _initializeScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? expectedScore = prefs.getInt("score");
    if (expectedScore == null) {
      await prefs.setInt("score", score!);
    } else {
      setState(() {
        score = expectedScore;
      });
    }
    print(score);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameProvider(),
      child: Consumer<GameProvider>(builder: (context, state, _) {
        // print("statestate: $state");
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 13, 57, 87),
          body: Stack(
            children: [
              Container(
                // height: 100,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.s,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Container(
                              // color: Colors.red,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.amber.shade700),
                              width: MediaQuery.of(context).size.width * 0.5,
                              height:
                                  MediaQuery.of(context).size.height * 0.057,
                              child: Center(
                                  child: Text(
                                "${score! - state.addTotalAmount()}",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25,
                                    letterSpacing: 2,
                                    color: Colors.white),
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: GestureDetector(
                              onTap: () {
                                // await menuDialog();
                                Menudialog.menu(context);
                                setState(() {});
                                print("Menu");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 4, color: Colors.white),
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.red.shade400,
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.width * 0.13,
                                child: const Icon(Icons.pause),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const CardPosition(),
                      CoinPosition(
                          // key: coinposition,
                          ),
                      const FloatingCoin()
                    ],
                  ),
                ),
              ),
              ...state.coinsWidget.map((e) => e),
            ],
          ),
          // floatingActionButton: const FloatingCoin(),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerFloat,
          // bottomNavigationBar: const FloatingCoin(),
        );
      }),
    );
  }
}
