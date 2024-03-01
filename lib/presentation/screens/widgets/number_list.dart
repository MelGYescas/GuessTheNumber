import 'package:flutter/material.dart';

class NumberList extends StatelessWidget {
  final String title;

  final List<int> numbers;
  const NumberList({super.key, required this.title, required this.numbers});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: 300,
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
