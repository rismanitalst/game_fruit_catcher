import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Game bakal tampil di sini'),
      ),
    );
  }
}

