import '../events/switch_events.dart';
import '../events/event.dart';
import '../interfaces/trans_methods.dart';
import '../states/switch_state.dart';
import 'basic_state_machine.dart';
import 'state.dart';
import 'trans.dart';

class SwitchStateMachine extends BasicStateMachine {
  SwitchStateMachine(super.currentState);

  @override
  void create() {
    states_[state_(SwitchStates.off)] = State([
      Trans(Reset(), state_(SwitchStates.off), OnNothing()),
      Trans(Click(), state_(SwitchStates.on), OnTrue())
    ]);

    states_[state_(SwitchStates.on)] = State([
      Trans(Reset(), state_(SwitchStates.off), OnNothing()),
      Trans(Click(), state_(SwitchStates.off), OnFalse())
    ]);
  }

  @override
  String? getEventName(int event) {
    // TODO: implement getEventName
    throw UnimplementedError();
  }

  @override
  String? getStateName(int state) {
    // TODO: implement getStateName
    throw UnimplementedError();
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
