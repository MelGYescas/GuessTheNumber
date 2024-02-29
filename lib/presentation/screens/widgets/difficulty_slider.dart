import 'package:flutter/material.dart';

class DifficultySlider extends StatefulWidget {
  const DifficultySlider({super.key});

  @override
  State<DifficultySlider> createState() => _DifficultySliderState();
}

class _DifficultySliderState extends State<DifficultySlider> {
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$_currentSliderValue',
          style: TextStyle(color: colorScheme.onSurface),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: colorScheme.primary,
            valueIndicatorTextStyle: TextStyle(
              color: colorScheme.onSurface,
            ),
          ),
          child: Slider(
            value: _currentSliderValue,
            min: 0,
            max: 4,
            divisions: 4,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
