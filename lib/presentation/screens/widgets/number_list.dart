import 'package:flutter/material.dart';
import 'package:guess_the_number/presentation/providers/historical_number_provider.dart';
import 'package:provider/provider.dart';

class NumberList extends StatelessWidget {
  final String title;

  const NumberList({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final numbers = Provider.of<HistoricalNumbersProvider>(context).numbers;

    return Container(
      height: 200,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: colorScheme.onSurface),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: colorScheme.onSurface),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: numbers.length,
              itemBuilder: (context, index) {
                return Center(
                    child: Text(
                  numbers[index].toString(),
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
