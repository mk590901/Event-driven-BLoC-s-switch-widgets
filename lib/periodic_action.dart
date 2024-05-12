import 'dart:async';

class PeriodicAction {

  final Duration _period;
  late Timer? _timer;

  PeriodicAction (this._period);

  void start(void Function() click) {
    print ('------- Obtainer.start -------');

    _timer = Timer.periodic(_period, (Timer t) {
       _callbackFunction(click);
    });

  }
  
  void _callbackFunction(void Function() click) {
    click();
  }

  void stop() {
    if (_timer != null && _timer!.isActive) {
      _timer?.cancel();
    }
    _timer = null;
    print ('------- Obtainer.stop  -------');

  }

  bool isActive() {
    return _timer != null && _timer!.isActive;
  }

}
