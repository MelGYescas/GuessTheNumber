import 'package:flutter/material.dart';

class AttemptsCounter extends StatelessWidget {
  final int attempts;
  const AttemptsCounter({super.key, required this.attempts});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

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
