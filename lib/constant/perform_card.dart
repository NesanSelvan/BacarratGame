import 'package:baccarat/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PerformCard {
  final BuildContext context;

  PerformCard(this.context);

  void performAction() {
    // Use Provider.of<T>(context) to get an instance of GameProvider
    final gameProvider = Provider.of<GameProvider>(context, listen: false);

    // Use gameProvider instance here to perform actions
    // For example:
  }
}
