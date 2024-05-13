import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../SizeConfig.dart';
import '../blocks/switch_bloc.dart';
import '../events/switch_events.dart';
import '../interfaces/i_click.dart';
import '../states/button_state.dart';

class FlatRoundedSwitch extends StatelessWidget  implements IClick {
  final String uuid = const Uuid().v4().toString();

  final Color canvasColor;
  final Color imageColor;
  final Color borderColor;
  final double width;
  final double height;
  final double borderRadius;
  final double borderWidth;
  final IconData? T;
  final IconData? F;
  final VoidCallback? onAction;

  late GestureDetector gestureDetector;

  FlatRoundedSwitch({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 4,
    this.borderWidth = 1,
    this.borderColor = Colors.black,
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double? borderRadius_ = w_(borderRadius);
    double? borderWidth_ = w_(borderWidth);
    return BlocProvider<SwitchBloc>(
      create: (_) => SwitchBloc(SwitchState(SwitchStates.off)),
      child: BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
          gestureDetector = GestureDetector(
          onTap: () {
            context.read<SwitchBloc>().add(Click(uuid));
            onAction?.call();
          },
             child: Container(
                 width: w_(width),
                 height: h_(height),
              decoration: BoxDecoration(
                color: canvasColor,
                borderRadius: BorderRadius.circular(borderRadius_!),
                border: Border.all(color: borderColor, width: borderWidth_!),
              ),
              child: Center(
                child: Icon(
                    state.state() == SwitchStates.off
                        ? F
                        : T,
                    size: h_(height * 0.8),
                    color: imageColor),
              ),
            //), // Your widget to rebuild based on state
          ),
        );
        return gestureDetector;
      }),
    );
  }
}
