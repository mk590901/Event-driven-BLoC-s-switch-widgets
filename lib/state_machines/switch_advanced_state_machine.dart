import '../events/switch_events.dart';
import '../events/event.dart';
import '../interfaces/trans_methods.dart';
import '../states/switch_advanced_state.dart';
import 'basic_state_machine.dart';
import 'state.dart';
import 'trans.dart';

class SwitchAdvancedStateMachine extends BasicStateMachine {
  SwitchAdvancedStateMachine(super.currentState);

  @override
  void create() {
    states_[state_(SwitchAdvancedStates.off)] = State([
      Trans(Reset(),  state_(SwitchAdvancedStates.off), OnNothing()),
      Trans(Down(),   state_(SwitchAdvancedStates.off2on), OnDown())
    ]);

    states_[state_(SwitchAdvancedStates.on)] = State([
      Trans(Reset(),  state_(SwitchAdvancedStates.off), OnNothing()),
      Trans(Down(),   state_(SwitchAdvancedStates.on2off), OnDown())
    ]);

    states_[state_(SwitchAdvancedStates.off2on)] = State([
      Trans(Reset(),  state_(SwitchAdvancedStates.off), OnNothing()),
      Trans(Up(),     state_(SwitchAdvancedStates.on), OnUp())
    ]);

    states_[state_(SwitchAdvancedStates.on2off)] = State([
      Trans(Reset(), state_(SwitchAdvancedStates.off), OnNothing()),
      Trans(Up(), state_(SwitchAdvancedStates.off), OnUp())
    ]);
  }

  @override
  String? getEventName(int event) {
    // TODO: implement getEventName
    throw UnimplementedError();
  }

  @override
  String? getStateName(int state) {
    String result = SwitchAdvancedStates.values[state].name;
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
