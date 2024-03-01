import 'package:flutter/material.dart';
import 'package:guess_the_number/presentation/providers/historical_number_provider.dart';
import 'package:provider/provider.dart';

class HistoricalList extends StatelessWidget {
  const HistoricalList({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final numbers = Provider.of<HistoricalNumbersProvider>(context).numbers;

    return Container(
      height: 200,
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
              itemCount: numbers.length,
              itemBuilder: (context, index) {
                return Center(
                    child: Text(
                  numbers[index].toString(),
                  style: TextStyle(
                    color: numbers[index] % 2 == 0 ? Colors.green : Colors.red,
                    fontSize: 18,
                  ),
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
