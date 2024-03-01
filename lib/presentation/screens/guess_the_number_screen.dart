import 'package:flutter/material.dart';
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

  // @override
  // Widget build(BuildContext context) {
  //   return ChangeNotifierProvider(
  //       // create: (context) => Guess(guessedNumber: 0), // Valor inicial
  //       child: Scaffold(
  //           appBar: AppBar(
  //             title: const Text("Adivina el Número"),
  //           ),
  //           body: const SingleChildScrollView(
  //               padding: EdgeInsets.all(20.0),
  //               child: Column(children: [
  //                 Row(mainAxisAlignment: MainAxisAlignment.center, children: [
  //                   Expanded(
  //                     child: Padding(
  //                       padding: EdgeInsets.all(8.0),
  //                       child: NumberField(),
  //                     ),
  //                   ),
  //                   Expanded(
  //                     child: Padding(
  //                       padding: EdgeInsets.symmetric(horizontal: 8.0),
  //                       child: HistoricalList(),
  //                     ),
  //                   ),
  //                 ]
  //                     // Row(
  //                     // mainAxisAlignment: MainAxisAlignment.center,
  //                     // children: [
  //                     //   const Expanded(
  //                     //     // Envuelve NumberField con Expanded
  //                     //     child: NumberField(),
  //                     //   ),
  //                     //   Expanded(child: Consumer<Guess>(
  //                     //     builder: (context, guess, child) {
  //                     //       // Muestra el valor actual de guessedNumber
  //                     //       return Text('Número actual: ${guess.guessedNumber}');
  //                     //     },
  //                     //   ))
  //                     // ],
  //                     ),
  //               ]))));
  // }

  @override
  Widget build(BuildContext context) {
    final int guessNumber = 0;

    // final gameState = Provider.of<GameState>(context);
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        //De aqui extraemos el numero
                        child: NumberField(guessNumber: guessNumber),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: AttemptsCounter(attempts: guessNumber),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
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
                      //aqui vamos añadiendo un numero

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
