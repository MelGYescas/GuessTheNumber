import 'package:flutter/material.dart';
import 'package:guess_the_number/presentation/providers/guess_provider.dart';
import 'package:provider/provider.dart';

class AttemptsCounter extends StatelessWidget {
  const AttemptsCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final attempts = Provider.of<GuessProvider>(context).attempts;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Intentos',
          style: TextStyle(color: colorScheme.onSurface),
        ),
        Text(
          '$attempts',
          style: TextStyle(
              color: colorScheme.onSurface,
              fontSize: textTheme.bodyMedium?.fontSize),
        ),
      ],
    );
  }
}
