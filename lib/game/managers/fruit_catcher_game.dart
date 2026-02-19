import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../components/basket.dart';

class FruitCatcherGame extends FlameGame {
  @override
  Color backgroundColor() {
    return const Color(0xFF87CEEB);
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();

    final basket = Basket(
      position: Vector2(size.x / 2, size.y - 60),
    );

    add(basket);
  }
}

