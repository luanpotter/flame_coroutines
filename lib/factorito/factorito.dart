import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_coroutines/factorito/factorito_world.dart';
import 'package:flame_coroutines/factorito/tile.dart';
import 'package:flame_coroutines/factorito/toolbar.dart';
import 'package:flame_coroutines/factorito/utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const GameWidget.controlled(gameFactory: FactoritoGame.new));
}

class FactoritoGame extends FlameGame<FactoritoWorld>
    with HasKeyboardHandlerComponents, TapCallbacks {
  late Toolbar toolbar;

  FactoritoGame()
    : super(
        camera: CameraComponent.withFixedResolution(
          width: tileSize * 16,
          height: tileSize * 9,
        ),
        world: FactoritoWorld(),
      );

  @override
  FutureOr<void> onLoad() async {
    add(toolbar = Toolbar());
    await super.onLoad();
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);

    final coords = camera.globalToLocal(event.localPosition) / tileSize;
    final block = Block(
      coords.x.floor(),
      coords.y.floor(),
    );

    final existingTile = world.children
        .whereType<Tile>()
        .where((t) => t.block == block)
        .firstOrNull;
    if (existingTile != null) {
      existingTile.removeFromParent();
    }

    final tileType = toolbar.selectedType;
    world.add(
      Tile(type: tileType, block: block),
    );
  }
}
