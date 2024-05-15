// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:button_k_states/events/switch_events.dart';
import 'package:button_k_states/state_machines/basic_state_machine.dart';
import 'package:button_k_states/state_machines/switch_advanced_state_machine.dart';
import 'package:button_k_states/states/switch_advanced_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('SwitchAdvancedStateMachine', () {
    BasicStateMachine?
      stateMachine = SwitchAdvancedStateMachine(state_(SwitchAdvancedStates.off));
    expect(stateMachine.state(),state_(SwitchAdvancedStates.off));
    stateMachine.dispatch(Reset());
    expect(stateMachine.state(),state_(SwitchAdvancedStates.off));
    stateMachine.dispatch(Down());
    expect(stateMachine.state(),state_(SwitchAdvancedStates.off2on));
    stateMachine.dispatch(Reset());
    expect(stateMachine.state(),state_(SwitchAdvancedStates.off));
//  off->on via off2on
    stateMachine.dispatch(Down());
    expect(stateMachine.state(),state_(SwitchAdvancedStates.off2on));
    stateMachine.dispatch(Up());
    expect(stateMachine.state(),state_(SwitchAdvancedStates.on));
//  on->off with reset
    stateMachine.dispatch(Reset());
    expect(stateMachine.state(),state_(SwitchAdvancedStates.off));
//  off->on via off2on
    stateMachine.dispatch(Down());
    expect(stateMachine.state(),state_(SwitchAdvancedStates.off2on));
    stateMachine.dispatch(Up());
    expect(stateMachine.state(),state_(SwitchAdvancedStates.on));
//  on->on2off with down
    stateMachine.dispatch(Down());
    expect(stateMachine.state(),state_(SwitchAdvancedStates.on2off));
//  on2off->off with reset
    stateMachine.dispatch(Reset());
    expect(stateMachine.state(),state_(SwitchAdvancedStates.off));
//  off->on via off2on
    stateMachine.dispatch(Down());
    expect(stateMachine.state(),state_(SwitchAdvancedStates.off2on));
    stateMachine.dispatch(Up());
    expect(stateMachine.state(),state_(SwitchAdvancedStates.on));
//  on->on2off with down
    stateMachine.dispatch(Down());
    expect(stateMachine.state(),state_(SwitchAdvancedStates.on2off));
//  on2off->off with reset
    stateMachine.dispatch(Up());
    expect(stateMachine.state(),state_(SwitchAdvancedStates.off));
  });
}
