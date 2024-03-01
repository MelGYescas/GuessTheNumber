import 'package:flutter/material.dart';
import 'package:guess_the_number/presentation/providers/game_provider.dart';
import 'package:guess_the_number/presentation/screens/widgets/attempts_counter.dart';
import 'package:guess_the_number/presentation/screens/widgets/difficulty_slider.dart';
import 'package:guess_the_number/presentation/screens/widgets/historical_list.dart';
import 'package:guess_the_number/presentation/screens/widgets/number_field.dart';
import 'package:guess_the_number/presentation/screens/widgets/number_list.dart';
import 'package:provider/provider.dart';

class GuessTheNumberScreen extends StatelessWidget {
  final String title;
  final int secret = 5;
  const GuessTheNumberScreen({Key? key, this.title = 'Adivina el número'})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [Text('${gameProvider.secretNumber}')],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: NumberField(),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: AttemptsCounter(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: NumberList(
                        title: 'Mayor que',
                        numbers: gameProvider.guessClueMajorHistory,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: NumberList(
                          title: 'Menor que',
                          numbers: gameProvider.guessClueMinorHistory,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: HistoricalList(),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: DifficultySlider(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
