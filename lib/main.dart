import 'package:flutter/material.dart';
import 'package:guess_the_number/presentation/providers/game_provider.dart';
import 'package:guess_the_number/presentation/screens/guess_the_number_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final ThemeData theme = ThemeData(
    primarySwatch: Colors.blue,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.blue,
      brightness: Brightness.dark,
    ).copyWith(
      secondary: Colors.deepPurple,
    ),
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 18,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => GameProvider()),
        ],
        child: MaterialApp(
          title: 'Guess The Number',
          theme: theme,
          debugShowCheckedModeBanner: false,
          home: const GuessTheNumberScreen(),
        ));
  }
}
