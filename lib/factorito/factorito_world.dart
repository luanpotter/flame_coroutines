import 'package:flame/components.dart';
import 'package:flame_coroutines/factorito/grid.dart';
import 'package:flame_coroutines/factorito/tile.dart';

class FactoritoWorld extends World {
  @override
  Future<void> onLoad() async {
    await addAll([
      Grid(),
      Tile(type: TileType.belt, block: const Block(0, 0)),
      Tile(type: TileType.smelter, block: const Block(0, 1)),
    ]);
    await super.onLoad();
  }
}
