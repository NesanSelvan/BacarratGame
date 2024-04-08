import 'package:baccarat/constant/global.dart';
import 'package:baccarat/main.dart';
import 'package:baccarat/widgets/floatingcoin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoinAnimation extends StatefulWidget {
  const CoinAnimation({
    super.key,
    required this.offset,
    required this.index,
    required this.selectedCoin,
    required this.coinsKeys, // Add coinsKeys parameter
  });
  final Offset offset;
  final int index;
  final int selectedCoin;
  final List<GlobalKey> coinsKeys; // Define coinsKeys parameter

  @override
  State<CoinAnimation> createState() => _CoinAnimationState();
  // static _CoinAnimationState? of(BuildContext context) =>
  //     context.findAncestorStateOfType<_CoinAnimationState>();
}

class _CoinAnimationState extends State<CoinAnimation> {
  double movex = 0;
  double movey = 0;

  bool isAnimating = false;

  void refreshScreen() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    final gameprovider = Provider.of<GameProvider>(context, listen: false);

    final position =
        gameprovider.getPosition(widget.coinsKeys[widget.index], "coin");
    movex = position?.dx ?? 0;
    movey = (position?.dy ?? 0) - 40;
    setState(() {});
    Future.delayed(const Duration(milliseconds: 2), () {
      movex = widget.offset.dx;
      movey = widget.offset.dy;
      print("widget Coin : ${widget.index}");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<GameProvider>(builder: (context, state, _) {
        return AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            top: movey,
            left: movex,
            child: Container(
                height: AppConstants.coinSize,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(2, 2))
                ], borderRadius: BorderRadius.circular(25)),
                child: Image.asset("assets/${widget.selectedCoin}.png")));
      }),
    );
  }
}
