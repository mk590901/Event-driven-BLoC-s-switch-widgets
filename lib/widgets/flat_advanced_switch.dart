import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../SizeConfig.dart';
import '../blocks/switch_advanced_bloc.dart';
import '../events/switch_events.dart';
import '../states/switch_advanced_state.dart';
import '../interfaces/i_click.dart';

class FlatAdvancedSwitch extends StatelessWidget implements IClick {
  final String uuid = const Uuid().v4().toString();

  final Color canvasTColor;
  final Color canvasFColor;
  final Color canvasDColor;
  final Color canvasUColor;
  final Color imageTColor;
  final Color imageFColor;
  final Color imageDColor;
  final Color imageUColor;
  final double width;
  final double height;
  final IconData? T;
  final IconData? F;
  final VoidCallback? onAction;

  late GestureDetector gestureDetector;

  FlatAdvancedSwitch({
    super.key,
    required this.width,
    required this.height,
    this.canvasTColor = Colors.transparent,
    this.canvasFColor = Colors.transparent,
    this.canvasDColor = Colors.black26,
    this.canvasUColor = Colors.black26,
    this.imageTColor = Colors.black,
    this.imageFColor = Colors.black,
    this.imageDColor = Colors.black,
    this.imageUColor = Colors.black,
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
    return BlocProvider<SwitchAdvancedBloc>(
      create: (_) => SwitchAdvancedBloc(SwitchAdvancedState(SwitchAdvancedStates.off)),
      child: BlocBuilder<SwitchAdvancedBloc, SwitchAdvancedState>(builder: (context, state) {
        gestureDetector = GestureDetector(
          onTapDown: (details) {
            context.read<SwitchAdvancedBloc>().add(Down(uuid));
            //onAction?.call();
          },
          onTapUp: (details) {
            context.read<SwitchAdvancedBloc>().add(Up(uuid));
            onAction?.call();
          },
          onTapCancel: () {
            context.read<SwitchAdvancedBloc>().add(Up(uuid));
          }
          ,
          child: Container(
            width: w_(width),
            height: h_(height),
            color: canvasColor(state.state()),
            child: Center(
              child: Icon(state.state() == SwitchAdvancedStates.off ? F : T,
                  size: h_(height * iconSize(state.state())), color: iconColor(state.state())),
            ),
          ),
        );
        return gestureDetector;
      }),
    );
  }

  Color? iconColor(SwitchAdvancedStates state) {
    Color? result = imageFColor;
    switch(state) {
      case SwitchAdvancedStates.off:
        result = imageFColor;
        break;
      case SwitchAdvancedStates.on:
        result = imageTColor;
        break;
      case SwitchAdvancedStates.off2on:
        result = imageUColor;
        break;
      case SwitchAdvancedStates.on2off:
        result = imageDColor;
        break;
      default:
    }
    return result;
  }

  num iconSize(SwitchAdvancedStates state) {
    double result = 0.9;
    switch(state) {
      case SwitchAdvancedStates.off:
      case SwitchAdvancedStates.on:
        result = 0.9;
        break;
      case SwitchAdvancedStates.off2on:
      case SwitchAdvancedStates.on2off:
        result = 1.0;
        break;
      default:
    }
    return result;
  }

  canvasColor(SwitchAdvancedStates state) {
    Color? result = canvasFColor;
    switch(state) {
      case SwitchAdvancedStates.off:
        result = canvasFColor;
        break;
      case SwitchAdvancedStates.on:
        result = canvasTColor;
        break;
      case SwitchAdvancedStates.off2on:
        result = canvasUColor;
        break;
      case SwitchAdvancedStates.on2off:
        result = canvasDColor;
        break;
      default:
    }
    return result;
  }
}
