import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame_coroutines/factorito/factorito.dart';
import 'package:flame_coroutines/factorito/tile.dart';
import 'package:flame_coroutines/factorito/utils.dart';
import 'package:flutter/services.dart';

class Toolbar extends PositionComponent
    with KeyboardHandler, HasGameReference<FactoritoGame> {
  static final _bg = Paint()..color = const Color(0xFF333333);
  static final _border = Paint()
    ..color = const Color(0xFFFFFF00)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.0;

  static const double _margin = 8.0;
  int selectedIndex = 0;

  TileType get selectedType => TileType.values[selectedIndex];

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    _updateSizing();
  }

  @override
  FutureOr<void> onLoad() {
    _updateSizing();
    return super.onLoad();
  }

  void _updateSizing() {
    const s = tileSize + _margin;
    size = Vector2(_margin + s * TileType.values.length, _margin + s);
    final gameSize = game.canvasSize;
    position = Vector2(
      (gameSize.x - size.x) / 2,
      gameSize.y - size.y - _margin,
    );
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    // wrapper
    final rect = size.toRect();
    canvas.drawRect(rect, _bg);

    // icons
    const s = tileSize + _margin;
    for (var i = 0; i < TileType.values.length; i++) {
      final iconRect = Rect.fromLTWH(
        _margin + i * s,
        _margin,
        tileSize,
        tileSize,
      );
      TileRenderer.renderTileType(canvas, TileType.values[i], iconRect);
      // selected border
      if (i == selectedIndex) {
        canvas.drawRect(iconRect.inflate(2.0), _border);
      }
    }
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (event is KeyDownEvent) {
      final digit = int.tryParse(event.character ?? '');
      if (digit != null) {
        if (digit >= 1 && digit <= TileType.values.length) {
          selectedIndex = digit - 1;
          return false;
        }
      }
    }
    return true;
  }
}
