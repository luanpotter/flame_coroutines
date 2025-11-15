import 'package:flame/game.dart';
import 'package:flame_coroutines/squares/squares_coroutine.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const GameWidget.controlled(gameFactory: SquaresCoroutineGame.new),
  );
}
