import 'dart:math';

import 'package:playing_cards/playing_cards.dart';

class RandomValue {
  final List<CardValue> cardValue = [
    CardValue.two,
    CardValue.three,
    CardValue.four,
    CardValue.five,
    CardValue.six,
    CardValue.seven,
    CardValue.eight,
    CardValue.nine,
    CardValue.ten,
    CardValue.jack,
    CardValue.queen,
    CardValue.king,
    CardValue.ace
  ];
  List<Suit> suits = [Suit.hearts, Suit.diamonds, Suit.clubs, Suit.spades];

  CardValue getRandomValue() {
    Random random = Random();
    int randomIndex = random.nextInt(cardValue.length);
    return cardValue[randomIndex];
  }

  Suit getRandomItem() {
    Random random = Random();
    int randomIndex = random.nextInt(suits.length);
    return suits[randomIndex];
  }
}
