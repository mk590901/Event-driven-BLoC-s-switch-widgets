import '../events/switch_events.dart';
import '../events/event.dart';
import '../interfaces/trans_methods.dart';
import '../states/button_state.dart';
import 'basic_state_machine.dart';
import 'state.dart';
import 'trans.dart';

class SwitchStateMachine extends BasicStateMachine {
  SwitchStateMachine(super.currentState);

  @override
  void create() {
    states_[state_(SwitchStates.stop)] = State([
      Trans(Reset(), state_(SwitchStates.stop), OnNothing()),
      Trans(Click(), state_(SwitchStates.play), OnPlay())
    ]);

    states_[state_(SwitchStates.play)] = State([
      Trans(Reset(), state_(SwitchStates.stop), OnNothing()),
      Trans(Click(), state_(SwitchStates.stop), OnStop())
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
