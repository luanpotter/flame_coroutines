import 'package:flame/game.dart';
import 'package:flame_coroutines/factorito/factorito.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const GameWidget.controlled(gameFactory: FactoritoGame.new),
  );
}
