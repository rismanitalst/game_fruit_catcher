import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'managers/audio_manager.dart';

class FruitCatcherGame extends FlameGame {
 
 @override
 Color backgroundColor() => const Color.fromARGB(255, 83, 164, 81); // matcha uwuw
final ValueNotifier<int> scoreNotifier = ValueNotifier<int>(0);

 @override
 Future<void> onLoad() async {
 await super.onLoad();
 // Play background music
 AudioManager().playBackgroundMusic(); 
 }

  void incrementScore() {}
}