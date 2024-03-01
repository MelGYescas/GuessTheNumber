import 'package:flutter/material.dart';
import 'package:guess_the_number/presentation/providers/game_provider.dart';
import 'package:provider/provider.dart';

class HistoricalList extends StatelessWidget {
  const HistoricalList({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final gameProvider = Provider.of<GameProvider>(context);
    final List<int> guessHistory = gameProvider.guessHistory;
    final int? secretNumber = gameProvider.secretNumber;

    return Container(
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(color: colorScheme.onSurface),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Historial',
            style: TextStyle(color: colorScheme.onSurface),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: guessHistory.length,
              itemBuilder: (context, index) {
                bool isGuessCorrect = guessHistory[index] == secretNumber;
                return Center(
                  child: Text(
                    guessHistory[index].toString(),
                    style: TextStyle(
                      color: isGuessCorrect ? Colors.green : Colors.red,
                      fontSize: 18,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
