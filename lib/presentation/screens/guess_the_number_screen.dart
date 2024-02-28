import 'package:flutter/material.dart';

class GuessTheNumberScreen extends StatelessWidget {
  final String title;

  const GuessTheNumberScreen({Key? key, this.title = 'Adivina el número'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: const Center(child: Text("Centrado")),
    );
  }
}
