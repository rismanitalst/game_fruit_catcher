import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';

import '../managers/fruit_catcher_game.dart';

import 'basket.dart';

enum FruitType { apple, banana, orange }

class Fruit extends PositionComponent
    with HasGameReference<FruitCatcherGame>, CollisionCallbacks {


  final FruitType type;
  final double speed;

  Fruit({
    required Vector2 position,
    required this.type,
    this.speed = 150,
  }) : super(
          position: position,
          size: Vector2.all(30),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // hitbox mengikuti ukuran buah
    add(
      CircleHitbox()
        ..collisionType = CollisionType.active,
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    // buah jatuh ke bawah
    position.y += speed * dt;

    // hapus kalau keluar layar
    if (position.y > game.size.y + size.y) {
      removeFromParent();
    }
  }

  @override
  void onCollision(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollision(intersectionPoints, other);

    if (other is Basket) {
      game.incrementScore();
      removeFromParent();
    }
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = _getColor();

    canvas.drawCircle(
      Offset(size.x / 2, size.y / 2),
      size.x / 2,
      paint,
    );
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
