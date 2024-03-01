import 'package:flutter/material.dart';
import 'package:guess_the_number/presentation/providers/historical_number_provider.dart';
import 'package:provider/provider.dart';

class NumberField extends StatefulWidget {
  final int guessNumber;

  const NumberField({required this.guessNumber, Key? key}) : super(key: key);

  @override
  State<NumberField> createState() => _NumberFieldState();
}

class _NumberFieldState extends State<NumberField> {
  String? _errorMessage;

  void _submitValue(String value) {
    final number = int.tryParse(value);
    if (number != null && number >= 0) {
      Provider.of<HistoricalNumbersProvider>(context, listen: false)
          .addNumber(number);
      setState(() {
        _errorMessage = null;
      });
    } else {
      setState(() {
        _errorMessage = 'Solo numeros positivos';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: colorScheme.onPrimary, width: 2.0),
    );

    return TextField(
      decoration: InputDecoration(
          labelText: 'Numbers',
          errorText: _errorMessage,
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder),
      style: TextStyle(color: colorScheme.onSurface),
      keyboardType: TextInputType.number,
      onSubmitted: _submitValue,
      textInputAction: TextInputAction.done,
    );
  }
}
