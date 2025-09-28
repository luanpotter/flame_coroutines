import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame_coroutines/factorito/base_component.dart';
import 'package:flame_coroutines/factorito/utils.dart';

class Tile extends BaseComponent {
  final TileType type;
  final Block block;

  Tile({
    required this.type,
    required this.block,
  }) : super(
         position: block.toVector2() * tileSize,
         size: Vector2.all(tileSize),
       );

  static final _typeStyles = {
    TileType.belt: BasicPalette.gray.paint(),
    TileType.ironMine: BasicPalette.darkBlue.paint(),
    TileType.copperMine: BasicPalette.orange.paint(),
    TileType.smelter: BasicPalette.brown.paint(),
    TileType.factory: BasicPalette.teal.paint(),
    TileType.sink: BasicPalette.white.paint(),
  };

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    TileRenderer.renderTileType(canvas, type, size.toRect());
  }
}

class TileRenderer {
  static void renderTileType(
    Canvas canvas,
    TileType type,
    Rect rect,
  ) {
    final style = Tile._typeStyles[type]!;
    canvas.drawRect(rect, style);
  }
}

enum TileType {
  belt,
  ironMine,
  copperMine,
  smelter,
  factory,
  sink,
}
