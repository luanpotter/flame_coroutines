import 'package:coroutines/coroutines.dart';
import 'package:flame/components.dart';
import 'package:flame_coroutines/factorito/factorito.dart';

class BaseComponent extends PositionComponent
    with CoroutineExecutor, HasGameReference<FactoritoGame> {
  BaseComponent({
    super.position,
    super.size,
  });

  @override
  void update(double dt) {
    super.update(dt);
    runAllCoroutines();
  }
}
