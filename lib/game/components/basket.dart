import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import '../managers/fruit_catcher_game.dart';


class Basket extends PositionComponent
    with HasGameReference<FruitCatcherGame>,
         CollisionCallbacks,
         DragCallbacks {


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
  void onDragUpdate(DragUpdateEvent event) {
    position.x += event.localDelta.x;

    final halfWidth = size.x / 2;

    if (position.x < halfWidth) {
      position.x = halfWidth;
    }

    if (position.x > game.size.x - halfWidth) {
      position.x = game.size.x - halfWidth;
    }
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = Colors.brown;
    canvas.drawRect(size.toRect(), paint);
  }
}
