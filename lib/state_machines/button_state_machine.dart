import '../events/switch_events.dart';
import '../events/event.dart';
import '../interfaces/trans_methods.dart';
import '../states/button_state.dart';
import 'basic_state_machine.dart';
import 'state.dart';
import 'trans.dart';

class ButtonStateMachine extends BasicStateMachine {
  ButtonStateMachine(super.currentState);

  @override
  void create() {
    states_[state_(ButtonStates.ready)] = State([
      Trans(Disable(),  state_(ButtonStates.disabled), OnDisable()),
      Trans(Down(),     state_(ButtonStates.pressed), OnPress())
    ]);

    states_[state_(ButtonStates.pressed)] = State([
      Trans(Reset(), state_(ButtonStates.ready), OnNothing()),
      Trans(Up(), state_(ButtonStates.ready), OnUnpress())
    ]);

    states_[state_(ButtonStates.disabled)] = State([
      Trans(Enable(), state_(ButtonStates.ready), OnEnable()),
    ]);
  }

  @override
  String? getEventName(int event) {
    // TODO: implement getEventName
    throw UnimplementedError();
  }

  @override
  String? getStateName(int state) {
    String result = ButtonStates.values[state].name;
    return result;
  }

  @override
  void publishEvent(Event event) {
    // TODO: implement publishEvent
  }

  @override
  void publishState(int state) {
    // TODO: implement publishState
  }
}
