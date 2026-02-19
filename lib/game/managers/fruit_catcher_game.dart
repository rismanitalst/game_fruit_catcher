import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../components/basket.dart';

class FruitCatcherGame extends FlameGame
    with HasCollisionDetection {

  int score = 0;

  @override
  Color backgroundColor() => const Color(0xFF87CEEB);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final basket = Basket(
      position: Vector2(size.x / 2, size.y - 100),
    );

    add(basket);
  }

  //dipanggil Fruit saat collision
  void incrementScore() {
    score++;
    debugPrint('Score: $score');
  }
}
