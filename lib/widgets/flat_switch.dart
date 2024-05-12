import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../SizeConfig.dart';
import '../blocks/button_bloc.dart';
import '../events/switch_events.dart';
//import '../interfaces/i_done.dart';
import '../states/button_state.dart';

class FlatSwitch extends StatelessWidget {
  final String uuid = const Uuid().v4().toString();

  final Color backgroundColor;
  final Color foregroundColor;
  final double width;
  final double height;
  final IconData? T;
  final IconData? F;
  final VoidCallback? onAction;

  late GestureDetector gestureDetector;

  FlatSwitch({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.width,
    required this.height,
    required this.T,
    required this.F,
    required this.onAction,
  });

  //@override
  void done() {
    print("done:uuid");
    gestureDetector.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider<SwitchBloc>(
      create: (_) => SwitchBloc(SwitchState(SwitchStates.off)),
      child: BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
          gestureDetector = GestureDetector(
          onTap: () {
            context.read<SwitchBloc>().add(Click.ext(uuid));
            onAction?.call();
          },
          child: SizedBox(
            width: w_(width),
            height: h_(height),
            child: Container(
              color: backgroundColor,
              child: Center(
                child: Icon(
                    state.state() == SwitchStates.off
                        ? F
                        : T,
                    size: h_(height * 0.95),
                    color: foregroundColor),
              ),
            ), // Your widget to rebuild based on state
          ),
        );
        return gestureDetector;
      }),
    );
  }
}
