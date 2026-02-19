import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';

class Basket extends PositionComponent
    with CollisionCallbacks {

  Basket({required Vector2 position})
      : super(
          position: position,
          size: Vector2(120, 40),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(
      RectangleHitbox()
        ..collisionType = CollisionType.passive,
    );
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = Colors.brown;
    canvas.drawRect(size.toRect(), paint);
  }
}
