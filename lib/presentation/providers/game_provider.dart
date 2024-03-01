import 'dart:math';

import 'package:flutter/material.dart';
import 'package:guess_the_number/domain/models/guess_history_model.dart';

enum DifficultyLevel {
  easy(10, 5),
  medium(20, 8),
  advanced(100, 15),
  extreme(1000, 25);

  final int maxNumber;
  final int attempts;

  const DifficultyLevel(this.maxNumber, this.attempts);
}

class GameProvider with ChangeNotifier {
  DifficultyLevel _currentDifficulty = DifficultyLevel.easy;
  int? _secretNumber;
  int _attemptsLeft;
  final List<GuessHistoryEntry> _guessHistory = [];
  final List<int> _guessClueMinorHistory = [];
  final List<int> _guessClueMajorHistory = [];
  bool _hasWon = false;

  GameProvider() : _attemptsLeft = 0 {
    _attemptsLeft = _currentDifficulty.attempts;
    _generateNewSecretNumber();
  }

  void _generateNewSecretNumber() {
    _secretNumber = Random().nextInt(_currentDifficulty.maxNumber) + 1;
    _attemptsLeft = _currentDifficulty.attempts;
    _guessClueMajorHistory.clear();
    _guessClueMinorHistory.clear();
    // _guessHistory.clear();
    _hasWon = false;
    notifyListeners();
  }

  void changeDifficulty(DifficultyLevel newDifficulty) {
    _currentDifficulty = newDifficulty;
    _generateNewSecretNumber();
  }

  void makeGuess(int guess) {
    if (guess < 1 || guess > _currentDifficulty.maxNumber) {
      return;
    }
    if (_secretNumber == null || _attemptsLeft <= 0) return;

    _attemptsLeft--;

    if (guess > _secretNumber!) _guessClueMinorHistory.add(guess);
    if (guess < _secretNumber!) _guessClueMajorHistory.add(guess);

    if (guess == _secretNumber) {
      _hasWon = true;
    }
    bool isCorrect = guess == _secretNumber;
    _guessHistory.add(GuessHistoryEntry(guess, isCorrect));

    if (_attemptsLeft <= 0 || _hasWon) {
      _generateNewSecretNumber();
    }

    notifyListeners();
  }

  // Getters
  DifficultyLevel get currentDifficulty => _currentDifficulty;
  int get attemptsLeft => _attemptsLeft;
  List<GuessHistoryEntry> get guessHistory => _guessHistory;
  List<int> get guessClueMinorHistory => _guessClueMinorHistory;
  List<int> get guessClueMajorHistory => _guessClueMajorHistory;
  bool get hasWon => _hasWon;
  int? get secretNumber => _secretNumber;
}
