import 'package:baccarat/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoinPosition extends StatefulWidget {
  const CoinPosition({super.key});

  @override
  State<CoinPosition> createState() => _CoinPositionState();
  static _CoinPositionState? of(BuildContext context) =>
      context.findAncestorStateOfType<_CoinPositionState>();
}

final GlobalKey<_CoinPositionState> coinposition =
    GlobalKey<_CoinPositionState>();

final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
// final GlobalKey<ScaffoldState> playerKey = GlobalKey<ScaffoldState>();
// final GlobalKey<ScaffoldState> bankerkey = GlobalKey<ScaffoldState>();

class _CoinPositionState extends State<CoinPosition> {
  bool isplayer_pressed = false;
  bool isbanker_pressed = false;
  bool istie_pressed = false;
  // List<int> coins = [];
  int? lastCoin;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      // color: Colors.teal,
      child: Consumer<GameProvider>(builder: (context, state, _) {
        print(state.addTotalAmount().toString());
        return Stack(
          children: [
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.13,
              left: MediaQuery.of(context).size.width * 0.38,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: istie_pressed
                        ? Text(
                            state.addTotalAmount().toString(),
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                color: Colors.amber.shade600,
                                letterSpacing: 2,
                                fontSize: 20 /
                                    896 *
                                    MediaQuery.of(context).size.height),
                          )
                        : const Text(""),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (state.dealAmount.isEmpty) {
                          isbanker_pressed = false;
                          isplayer_pressed = false;
                          istie_pressed = true;
                          state.isCoinPosition = true;
                          state.coinpos = "tie";
                        }
                        print("deal amount ${state.dealAmount.isEmpty}");
                        // coinAnimationKey.currentState?.movecoin(0, -0.8);
                      });
                    },
                    child: Container(
                      key: istie_pressed ? key : null,
                      height: MediaQuery.of(context).size.height * 0.12,
                      width: MediaQuery.of(context).size.height * 0.12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.transparent,
                          border: Border.all(
                              width: MediaQuery.of(context).size.height * 0.009,
                              color: istie_pressed
                                  ? Colors.amber.shade700
                                  : Colors.white)),
                      child: Stack(
                        children: [
                          Center(
                              child: Text(
                            "Tie",
                            style: GoogleFonts.roboto(
                                fontSize: 24 /
                                    896 *
                                    MediaQuery.of(context).size.height,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2,
                                color: istie_pressed
                                    ? Colors.amber.shade700
                                    : Colors.white),
                          )),
                          state.dealAmount.isNotEmpty && istie_pressed
                              ? GestureDetector(
                                  onTap: () {
                                    state.remove();
                                  },
                                  child: Container(
                                      // height: 10,
                                      // width: 10,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: Colors.red),
                                      child: const Icon(Icons.remove)),
                                )
                              : Container()
                          // ...state.dealAmount.map((e) => e == 5
                          //     ? Image.asset("assets/5.png")
                          //     : Image.asset("assets/10.png"))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.02,
            // ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.002,
              left: MediaQuery.of(context).size.width * 0.051,
              child: Column(
                children: [
                  isplayer_pressed
                      ? Text(
                          state.addTotalAmount().toString(),
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              color: Colors.amber.shade600,
                              letterSpacing: 2,
                              fontSize: 20 /
                                  896 *
                                  MediaQuery.of(context).size.height),
                        )
                      : const Text(""),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (state.dealAmount.isEmpty) {
                          isplayer_pressed = true;
                          isbanker_pressed = false;
                          istie_pressed = false;
                          state.isCoinPosition = true;
                          state.coinpos = "player";
                        }
                        // coinAnimationKey.currentState
                        //     ?.movecoin(-0.75, 0.12);

                        // Update the alignment to make the image transition from bottom
                      });
                    },
                    child: Container(
                      key: isplayer_pressed ? key : null,
                      height: MediaQuery.of(context).size.height * 0.12,
                      width: MediaQuery.of(context).size.height * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        // color: Colors.red,
                        border: Border.all(
                          width: MediaQuery.of(context).size.height * 0.009,
                          color: isplayer_pressed
                              ? Colors.amber.shade700
                              : Colors.white,
                        ),
                      ),
                      child: Stack(
                        children: [
                          state.dealAmount.isNotEmpty && isplayer_pressed
                              ? GestureDetector(
                                  onTap: () {
                                    state.remove();
                                  },
                                  child: Container(
                                      // height: 10,
                                      // width: 10,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: Colors.red),
                                      child: const Icon(Icons.remove)),
                                )
                              : Container(),
                          Center(
                            child: Text(
                              " Player ",
                              style: GoogleFonts.roboto(
                                fontSize: 24 /
                                    896 *
                                    MediaQuery.of(context).size.height,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2,
                                color: isplayer_pressed
                                    ? Colors.amber.shade700
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.002,
              right: MediaQuery.of(context).size.width * 0.051,
              child: Column(
                children: [
                  isbanker_pressed
                      ? Text(
                          state.addTotalAmount().toString(),
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              color: Colors.amber.shade600,
                              letterSpacing: 2,
                              fontSize: 20 /
                                  896 *
                                  MediaQuery.of(context).size.height),
                        )
                      : const Text(""),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (state.dealAmount.isEmpty) {
                          isbanker_pressed = true;
                          isplayer_pressed = false;
                          istie_pressed = false;
                          state.isCoinPosition = true;
                          state.coinpos = "banker";
                        }
                        // coinAnimationKey.currentState
                        //     ?.movecoin(0.75, 0.12);
                      });
                    },
                    child: Container(
                      key: isbanker_pressed ? key : null,
                      height: MediaQuery.of(context).size.height * 0.12,
                      width: MediaQuery.of(context).size.height * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.transparent,
                        border: Border.all(
                          width: MediaQuery.of(context).size.height * 0.009,
                          color: isbanker_pressed
                              ? Colors.amber.shade700
                              : Colors.white,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                              "Banker",
                              style: GoogleFonts.roboto(
                                fontSize: 24 /
                                    896 *
                                    MediaQuery.of(context).size.height,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2,
                                color: isbanker_pressed
                                    ? Colors.amber.shade700
                                    : Colors.white,
                              ),
                            ),
                          ),
                          state.dealAmount.isNotEmpty && isbanker_pressed
                              ? GestureDetector(
                                  onTap: () {
                                    // state.dealAmount.length =ZZZZZ
                                    state.remove();
                                    print(state.dealAmount);
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: Colors.red),
                                      child: const Icon(Icons.remove)),
                                )
                              : Container()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // CoinAnimation(
            //   key: coinAnimationKey,
            // ),
          ],
        );
      }),
    );
  }
}
