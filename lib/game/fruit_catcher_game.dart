import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'components/basket.dart';
import 'components/fruit.dart';

class FruitCatcherGame extends FlameGame {

  int score = 0;
  late TextComponent scoreText;
  final Random random = Random();

  @override
  Color backgroundColor() => const Color(0xFF87CEEB);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final basket = Basket(
      position: Vector2(size.x / 2, size.y - 100),
    );

    add(basket);

    scoreText = TextComponent(
      text: 'Score: 0',
      position: Vector2(10, 10),
      anchor: Anchor.topLeft,
      priority: 10,
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    add(scoreText);

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
    scoreText.text = 'Score: $score';
  }
}
