import 'dart:ui';

import 'package:flame/palette.dart';
import 'package:flame_coroutines/factorito/base_component.dart';
import 'package:flame_coroutines/factorito/utils.dart';

class Grid extends BaseComponent {
  static final Paint paint = BasicPalette.white.paint();

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final width = game.size.x;
    final height = game.size.y;

    for (var x = -width; x <= width; x += tileSize) {
      canvas.drawLine(Offset(x, -height), Offset(x, height), paint);
    }
    for (var y = -height; y <= height; y += tileSize) {
      canvas.drawLine(Offset(-width, y), Offset(width, y), paint);
    }
  }
}
