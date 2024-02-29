import 'package:flutter/material.dart';
import 'package:guess_the_number/presentation/screens/widgets/attempts_counter.dart';
import 'package:guess_the_number/presentation/screens/widgets/difficulty_slider.dart';
import 'package:guess_the_number/presentation/screens/widgets/number_field.dart';
import 'package:guess_the_number/presentation/screens/widgets/historical_list.dart';
import 'package:guess_the_number/presentation/screens/widgets/number_list.dart';

class GuessTheNumberScreen extends StatelessWidget {
  final String title;

  const GuessTheNumberScreen({Key? key, this.title = 'Adivina el número'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        body: const SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
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
                        child: AttemptsCounter(attempts: 2),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: NumberList(title: 'Mayor que'),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: NumberList(title: 'Menor que'),
                      ),
                    ),
                    Expanded(
                      child: HistoricalList(),
                    ),
                  ],
                ),
                Padding(
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
