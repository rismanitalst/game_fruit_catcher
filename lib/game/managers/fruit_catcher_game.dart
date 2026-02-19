import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../components/basket.dart';
import '../components/fruit.dart';

class FruitCatcherGame extends FlameGame {

  final Random random = Random();

  int score = 0;

  @override
  Color backgroundColor() => const Color(0xFF87CEEB);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // spawn basket
    final basket = Basket(
      position: Vector2(size.x / 2, size.y - 100),
    );

    add(basket);

    // timer spawn fruit
    add(
      TimerComponent(
        period: 1.5,
        repeat: true,
        onTick: spawnFruit,
      ),
    );
  }

  void spawnFruit() {
    final xPosition = random.nextDouble() * size.x;

    final fruit = Fruit(
      position: Vector2(xPosition, -30),
      type: Fruit.randomType(),
    );

    add(fruit);
  }

  void incrementScore() {
    score++;
    debugPrint('Score: $score');
  }
}
