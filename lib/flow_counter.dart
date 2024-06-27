class FlowCounter {

  final int min;
  final int max;
  final int step;
  final int initial;

  late  int counter;

  FlowCounter(this.min, this.max, this.step, this.initial) {
    counter = initial;
  }

  int value() {
    return counter;
  }

  int inc() {
    if (counter < max) {
      counter += step;
    }
    return counter;
  }

  int dec() {
    if (counter > min) {
      counter -= step;
    }
    return counter;
  }

}