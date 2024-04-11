import 'package:baccarat/animation/coin_animation.dart';
import 'package:baccarat/constant/global.dart';
import 'package:baccarat/screens/gamescreen.dart';
import 'package:baccarat/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:playing_cards/playing_cards.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => const HomeScreen(),
        "/game": (context) => const GameScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      },
    );
  }
}

class GameProvider extends ChangeNotifier {
  List<int> coins = [5, 10, 50, 75, 100];
  List<int> dealAmount = [];
  List<Widget> coinsWidget = [];
  bool isCoinPosition = false;
  String coinpos = "";
  bool isdeal = false;
  int playerCoins = 1000;
  List<Offset> playerCardPosition = [
    Offset(500, 0),
    Offset(500, 0),
    Offset(500, 0)
  ];
  List<Offset> bankerCardPosition = [
    Offset(500, 0),
    Offset(500, 0),
    Offset(500, 0)
  ];
  bool callPlayerCard = false;
  bool callBankerCard = false;
  bool globalCallPlayerCard = false;
  List<CardValue> playerCardValue = [];
  List<CardValue> bankerCardValue = [];
  List<Suit> playerCardType = [];
  List<Suit> bankerCardType = [];
  int totalPlayerPoints = 0;
  int totalBankerPoints = 0;
  List<GlobalKey> coinsKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];
  void addDealAmount(int amount) {
    dealAmount.add(amount);
    notifyListeners();
  }

  void globalKeyDispose() {
    for (var key in coinsKeys) {
      key.currentState?.dispose();
    }
    // super.dispose();

    notifyListeners();
  }

  void addCoin(Offset offset, int index, int coin) {
    coinsWidget.add(CoinAnimation(
      offset: offset,
      index: index,
      selectedCoin: coin,
      coinsKeys: coinsKeys,
    ));

    notifyListeners();
  }

  int addTotalAmount() {
    int sum = 0;
    List<int> value = dealAmount;

    print("amount $value");
    for (int ele in value) {
      sum += ele;
      print("ele$ele");
    }
    // playerCoins -= sum;
    return sum;
  }

  void remove() {
    dealAmount.removeLast();
    coinsWidget.removeLast();
    notifyListeners();
  }

  Offset? getPosition(GlobalKey key, String objectName) {
    final box = key.currentContext?.findRenderObject() as RenderBox?;
    final size = box?.size;
    final offset = box?.localToGlobal(Offset.zero);
    if (offset == null) {
      return null;
    }
    if (size == null) {
      return null;
    }
    if (objectName == "player") {
      return Offset(offset.dx + size.width / 5 - 180,
          offset.dy + size.height / 2 - AppConstants.cardSize / 2);
    } else if (objectName == "banker") {
      return Offset(offset.dx + size.width / 3 - 100,
          offset.dy + size.height / 2 - AppConstants.cardSize / 2);
    } else if (objectName == "coin") {
      return Offset(offset.dx + size.width / 3 - AppConstants.coinSize / 2,
          offset.dy + size.height / 3 - AppConstants.coinSize / 2);
    }
    return null;
  }
}
