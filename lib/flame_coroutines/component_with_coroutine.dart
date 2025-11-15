import 'package:coroutines/sync.dart';
import 'package:flame/components.dart';

class CoroutineRate {
  final double secondsPerStep;

  const CoroutineRate.fromFps(int fps) : secondsPerStep = 1 / fps;
  const CoroutineRate.fromSecondsPerStep(this.secondsPerStep);
  const CoroutineRate.standard() : this.fromFps(60);
}

mixin ComponentWithCoroutine on Component {
  final CoroutineExecutor coroutines = CoroutineExecutor();

  /// Override this to change the default FPS for coroutines in this component.
  CoroutineRate coroutineRate = const CoroutineRate.standard();

  double _remainingDt = 0.0;

  @override
  void update(double dt) {
    super.update(dt);
    updateCoroutines(dt);
  }

  void updateCoroutines(double dt) {
    _remainingDt += dt;
    while (_remainingDt > coroutineRate.secondsPerStep) {
      _remainingDt -= coroutineRate.secondsPerStep;
      coroutines.runAllCoroutines();
    }
  }
}
