import 'package:flutter/material.dart';
import 'package:guess_the_number/presentation/providers/game_provider.dart';
import 'package:provider/provider.dart';

class NumberField extends StatefulWidget {
  const NumberField({Key? key}) : super(key: key);

  @override
  State<NumberField> createState() => _NumberFieldState();
}

class _NumberFieldState extends State<NumberField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String? _errorMessage;

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _submitValue(String value) {
    final number = int.tryParse(value);
    final maxNumber = Provider.of<GameProvider>(context, listen: false)
        .currentDifficulty
        .maxNumber;

    _controller.clear();
    FocusScope.of(context).requestFocus(_focusNode);
    if (number != null) {
      if (number >= 1 && number <= maxNumber) {
        Provider.of<GameProvider>(context, listen: false).makeGuess(number);
        setState(() {
          _errorMessage = null;
        });
      } else {
        setState(() {
          _errorMessage = 'Número fuera de rango (1-$maxNumber)';
        });
      }
    } else {
      setState(() {
        _errorMessage = 'Solo números positivos';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: colorScheme.primary, width: 2.0),
    );
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      decoration: InputDecoration(
          labelText: 'Numbers ',
          errorText: _errorMessage,
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder),
      style: Theme.of(context).textTheme.bodyMedium,
      keyboardType: TextInputType.number,
      onSubmitted: _submitValue,
      textInputAction: TextInputAction.done,
    );
  }
}
