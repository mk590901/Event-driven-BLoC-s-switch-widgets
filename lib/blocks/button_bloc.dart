import 'package:flutter_bloc/flutter_bloc.dart';

import '../events/switch_events.dart';
import '../events/event.dart';
import '../state_machines/basic_state_machine.dart';
import '../state_machines/switch_state_machine.dart';
import '../states/button_state.dart';

class SwitchBloc extends Bloc<Event, SwitchState> {
  BasicStateMachine? _stateMachine;

  SwitchBloc(SwitchState state) : super(state) {
    _stateMachine = SwitchStateMachine(state_(SwitchStates.stop));
    on<Reset>((event, emit) {
      done(event, emit);
    });
    on<Click>((event, emit) {
      done(event, emit);
    });
  }

  void done(Event event, Emitter<SwitchState> emit) {
    int newState = _stateMachine!.dispatch(event);
    if (newState >= 0) {
      SwitchState nextState = SwitchState(SwitchStates.values[newState]);
      nextState.setData(event.getData());
      emit(nextState);
    }
  }
}
