import 'package:coroutines/coroutines.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const GameWidget.controlled(gameFactory: CoroutineGame.new));
}

class CoroutineGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await addAll([
      CoroutineRectangle(),
    ]);
    await super.onLoad();
  }
}

class CoroutineRectangle extends PositionComponent with CoroutineExecutor {
  static final _paint = BasicPalette.blue.paint();

  CoroutineRectangle()
    : super(
        position: Vector2(100, 100),
        size: Vector2(100, 100),
        anchor: Anchor.center,
      );

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(size.toRect(), _paint);
  }
}
