import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/collisions.dart';


class Basket extends PositionComponent {
  Basket({required Vector2 position}) {
    this.position = position;
    size = Vector2(120, 40);
    anchor = Anchor.center;
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();

    add(
      RectangleHitbox()
        ..collisionType = CollisionType.passive,
    );
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final paint = Paint()..color = Colors.brown;
    canvas.drawRect(size.toRect(), paint);
  }
}