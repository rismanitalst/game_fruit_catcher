import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'components/basket.dart';
import 'components/fruit.dart';

class FruitCatcherGame extends FlameGame {

  // game state
  int score = 0;
  bool isGameOver = false;

  late TextComponent scoreText;
  late TimerComponent fruitSpawner;

  final Random random = Random();

  // background
  @override
  Color backgroundColor() => const Color(0xFF87CEEB);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // basket
    final basket = Basket(
      position: Vector2(size.x / 2, size.y - 100),
    );
    add(basket);

    // score UI
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

    // fruit spawner timer
    fruitSpawner = TimerComponent(
      period: 1.5,
      repeat: true,
      onTick: spawnFruit,
    );

    add(fruitSpawner);
  }

  // spawn fruit
  void spawnFruit() {
    if (isGameOver) return;

    final xPosition = random.nextDouble() * size.x;

    final fruit = Fruit(
      position: Vector2(xPosition, -30),
      type: Fruit.randomType(),
    );

    add(fruit);
  }

  // sistem skor
  void incrementScore() {
    if (isGameOver) return;

    score++;
    scoreText.text = 'Score: $score';
  }
}
