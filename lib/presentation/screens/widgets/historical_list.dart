import 'package:flutter/material.dart';

class HistoricalList extends StatelessWidget {
  const HistoricalList({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    List<int> numbers = [
      1,
      9,
      17,
      8,
      60,
      5,
      2,
      17,
      23,
      23,
      5,
      5,
      3,
      2,
      12,
      4,
      2
    ];

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
