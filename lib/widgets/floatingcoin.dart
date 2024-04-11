import 'package:baccarat/main.dart';
import 'package:baccarat/screens/gamescreen.dart';
import 'package:baccarat/widgets/coin_position.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FloatingCoin extends StatefulWidget {
  const FloatingCoin({Key? key}) : super(key: key);

  @override
  State<FloatingCoin> createState() => _FloatingCoinState();
}

class _FloatingCoinState extends State<FloatingCoin> {
  List<int> coins = [5, 10, 50, 75, 100];

  final gamescren = const GameScreen();
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, state, _) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.amber.shade700,
          ),
          height: MediaQuery.of(context).size.height * 0.081,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(1, 2),
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber.shade500,
              ),
              child: ListView.separated(
                itemCount: coins.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 20),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    key: state.coinsKeys[
                        index], // Use unique GlobalKey for each Padding
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 0),
                    child: InkWell(
                      onTap: () {
                        print("coins[index]: ${coins[index]}");

                        final offset = state.getPosition(key, "coin");

                        if (context.read<GameProvider>().isCoinPosition) {
                          if (!state.isdeal) {
                            context
                                .read<GameProvider>()
                                .addDealAmount(coins[index]);
                          }
                        }
                        if (offset != null) {
                          if (!state.isdeal) {
                            context
                                .read<GameProvider>()
                                .addCoin(offset, index, coins[index]);
                          }
                        }
                        setState(() {
                          selectedIndex = index;
                          // print('Coins Keys :$coinsKeys');
                        });
                      },
                      focusColor: Colors.red,
                      child: Container(
                        height: 12,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(2, 2),
                            ),
                          ],
                          border: selectedIndex == index
                              ? Border.all(width: 3, color: Colors.white)
                              : Border.all(width: 3, color: Colors.black),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Image.asset("assets/${coins[index]}.png"),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
    });
  }
}
