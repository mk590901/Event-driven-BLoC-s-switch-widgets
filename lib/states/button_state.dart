enum SwitchStates { stop, play }

int state_(SwitchStates state) {
  return state.index;
}

class ButtonState {
  final SwitchStates _state;
  String? _data;

  ButtonState(this._state) {
    _data = null;
  }

  SwitchStates state() {
    return _state;
  }

  void setData(String? data) {
    _data = data;
  }

  String? data() {
    return _data;
  }
}
