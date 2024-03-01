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
    primaryColor: Colors.blue,
    brightness: Brightness.dark,
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
