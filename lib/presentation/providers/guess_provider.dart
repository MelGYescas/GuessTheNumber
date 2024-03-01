import 'package:flutter/material.dart';

class GuessProvider with ChangeNotifier {
  final int guessedNumber;
  int _attempts = 0;

  GuessProvider({this.guessedNumber = 0});

  int get attempts => _attempts;

  void increaseAttempts() {
    _attempts++;
    notifyListeners();
  }

  void resetAttempts() {
    _attempts = 0;
    notifyListeners();
  }
}
