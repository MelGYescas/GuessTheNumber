import 'package:flutter/material.dart';
import 'package:guess_the_number/domain/models/guess_history_model.dart';
import 'package:guess_the_number/presentation/providers/game_provider.dart';
import 'package:provider/provider.dart';

class HistoricalList extends StatefulWidget {
  const HistoricalList({super.key});

  @override
  State<HistoricalList> createState() => _HistoricalListState();
}

class _HistoricalListState extends State<HistoricalList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final gameProvider = Provider.of<GameProvider>(context);
    final List<GuessHistoryEntry> guessHistory = gameProvider.guessHistory;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });

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
              controller: _scrollController,
              itemCount: guessHistory.length,
              itemBuilder: (context, index) {
                final entry = guessHistory[index];
                return Center(
                  child: Text(
                    entry.guess.toString(),
                    style: TextStyle(
                      color: entry.wasCorrect ? Colors.green : Colors.red,
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
