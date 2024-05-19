enum SwitchAdvancedStates { off, on, off2on, on2off, disabled_off, disabled_on }

int state_(SwitchAdvancedStates state) {
  return state.index;
}

class SwitchAdvancedState {
  final SwitchAdvancedStates _state;
  String? _data;

  SwitchAdvancedState(this._state) {
    _data = null;
  }

  SwitchAdvancedStates state() {
    return _state;
  }

  void setData(String? data) {
    _data = data;
  }

  String? data() {
    return _data;
  }
}
