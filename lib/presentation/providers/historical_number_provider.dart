import 'package:flutter/material.dart';

class HistoricalNumbersProvider with ChangeNotifier {
  final List<int> _numbers = [];

  List<int> get numbers => List.unmodifiable(_numbers);

  void addNumber(int number) {
    _numbers.add(number);
    notifyListeners();
  }
}
