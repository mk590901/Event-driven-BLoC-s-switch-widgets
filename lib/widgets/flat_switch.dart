import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../SizeConfig.dart';
import '../blocks/switch_bloc.dart';
import '../events/switch_events.dart';
import '../states/switch_state.dart';
import '../interfaces/i_click.dart';

class FlatSwitch extends StatelessWidget implements IClick {
  final String uuid = const Uuid().v4().toString();

  final Color canvasColor;
  final Color imageColor;
  final double width;
  final double height;
  final IconData? T;
  final IconData? F;
  final VoidCallback? onAction;

  late GestureDetector gestureDetector;

  late SwitchBloc switchBloc;

  FlatSwitch({
    super.key,
    required this.width,
    required this.height,
    this.canvasColor = Colors.transparent,
    this.imageColor = Colors.black,
    this.T = Icons.toggle_on_outlined,
    this.F = Icons.toggle_off_outlined,
    this.onAction,
  });

  @override
  void click() {
    gestureDetector.onTap?.call();
  }

  void reset() {
    try {
      switchBloc.add(Reset());
    }
    catch(exception) {
      debugPrint ("******* error *******");
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider<SwitchBloc>(
      create: (BuildContext context) {
          switchBloc = SwitchBloc(SwitchState(SwitchStates.off));
          return switchBloc;
        },
      child: BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
        gestureDetector = GestureDetector(
          onTap: () {
            context.read<SwitchBloc>().add(Click(uuid));
            onAction?.call();
          },
          child: Container(
            width: w_(width),
            height: h_(height),
            color: canvasColor,
            child: Center(
              child: Icon(state.state() == SwitchStates.off ? F : T,
                  size: h_(height * 0.95), color: imageColor),
            ),
          ),
        );
        return gestureDetector;
      }),
    );
  }
}
