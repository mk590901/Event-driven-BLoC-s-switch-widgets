import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../SizeConfig.dart';
import '../blocks/switch_advanced_bloc.dart';
import '../events/switch_events.dart';
import '../states/switch_advanced_state.dart';
import '../interfaces/i_click.dart';

class FlatAdvancedRoundedSwitch extends StatelessWidget implements IClick {
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
  final double borderRadius;
  final double borderWidth;
  final Color borderTColor;
  final Color borderFColor;
  final IconData? T;
  final IconData? F;
  final VoidCallback? onAction;

  late GestureDetector gestureDetector;

  FlatAdvancedRoundedSwitch({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 4,
    this.borderWidth = 1,
    this.borderTColor = Colors.black,
    this.borderFColor = Colors.black,
    this.canvasTColor = Colors.black12,
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
    gestureDetector.onTapDown?.call(TapDownDetails());
    gestureDetector.onTapUp?.call(TapUpDetails(kind: PointerDeviceKind.touch));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double? borderRadius_ = w_(borderRadius);
    double? borderWidth_ = w_(borderWidth);
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
            decoration: BoxDecoration(
              color: canvasColor(state.state()),
              borderRadius: BorderRadius.circular(borderRadius_!),
              border: Border.all(color: borderColor(state.state()), width: borderWidth_!),
            ),
            //color: canvasColor(state.state()),
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
    double result = 0.8;
    switch(state) {
      case SwitchAdvancedStates.off:
      case SwitchAdvancedStates.on:
        result = 0.8;
        break;
      case SwitchAdvancedStates.off2on:
      case SwitchAdvancedStates.on2off:
        result = 0.95;
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

  borderColor(SwitchAdvancedStates state) {
    Color? result = borderFColor;
    switch(state) {
      case SwitchAdvancedStates.off:
        result = borderFColor;
        break;
      case SwitchAdvancedStates.on:
        result = borderTColor;
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
