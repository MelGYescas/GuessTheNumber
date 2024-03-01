import 'package:flutter/material.dart';
import 'package:guess_the_number/presentation/providers/game_provider.dart';
import 'package:provider/provider.dart';

class AttemptsCounter extends StatelessWidget {
  const AttemptsCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final int attemptsLeft = Provider.of<GameProvider>(context).attemptsLeft;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Intentos restantes:',
          style: TextStyle(color: colorScheme.onSurface),
        ),
        Text(
          '$attemptsLeft',
          style: TextStyle(
              color: colorScheme.onSurface,
              fontSize: textTheme.bodyMedium?.fontSize),
        ),
      ],
    );
  }
}
