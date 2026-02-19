import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';


enum FruitType { apple, banana, orange }

class Fruit extends PositionComponent {
  final FruitType type;
  final double speed;

  Fruit({
    required Vector2 position,
    required this.type,
    this.speed = 150,
  }) {
    this.position = position;
    size = Vector2(30, 30);
    anchor = Anchor.center;
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += speed * dt;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final paint = Paint()..color = _getColor();
    canvas.drawCircle(Offset(size.x / 2, size.y / 2), size.x / 2, paint);
  }

  Color _getColor() {
    switch (type) {
      case FruitType.apple:
        return Colors.red;
      case FruitType.banana:
        return Colors.yellow;
      case FruitType.orange:
        return Colors.orange;
    }
  }

  static FruitType randomType() {
    final random = Random();
    return FruitType.values[random.nextInt(FruitType.values.length)];
  }
}
