import 'package:flutter_bloc/flutter_bloc.dart';

import '../events/button_events.dart';
import '../events/event.dart';
import '../state_machines/basic_state_machine.dart';
import '../state_machines/button_state_machine.dart';
import '../states/button_state.dart';

class ButtonBloc extends Bloc<Event, SwitchState> {
  BasicStateMachine? _stateMachine;

  ButtonBloc(SwitchState state) : super(state) {
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
