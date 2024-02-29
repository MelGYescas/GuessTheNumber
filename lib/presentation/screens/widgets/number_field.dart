import 'package:flutter/material.dart';

class NumberField extends StatefulWidget {
  const NumberField({Key? key}) : super(key: key);

  @override
  State<NumberField> createState() => _NumberFieldState();
}

class _NumberFieldState extends State<NumberField> {
  int _currentInputValue = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Corrected

  void _submitForm() {
    // Corrected placement and context access
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Processing Data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Form(
      // Added Form widget
      key: _formKey,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Numbers',
          border: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.primary),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.primary, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.primary, width: 2.0),
          ),
        ),
        style: TextStyle(color: colorScheme.onSurface),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          final number = int.tryParse(value);
          if (number != null && number >= 0) {
            setState(() {
              _currentInputValue = number;
            });
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a number';
          }
          final number = int.tryParse(value);
          if (number == null || number < 0) {
            return 'Only positive numbers are allowed';
          }
          return null;
        },
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (value) => _submitForm(), // Corrected
      ),
    );
  }
}
