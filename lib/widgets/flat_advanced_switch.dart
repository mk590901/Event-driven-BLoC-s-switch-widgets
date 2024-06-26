import 'dart:ui';

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
  final Color iconTColor;
  final Color iconFColor;
  final Color iconDColor;
  final Color iconUColor;
  final Color canvasDisabledColor;
  final Color iconDisabledColor;
  final double width;
  final double height;
  final IconData? T;
  final IconData? F;
  final VoidCallback? onDownAction;
  final VoidCallback? onUpAction;

  late GestureDetector gestureDetector;

  final SwitchAdvancedBloc switchBloc = SwitchAdvancedBloc(SwitchAdvancedState(SwitchAdvancedStates.off));

  FlatAdvancedSwitch({
    super.key,
    required this.width,
    required this.height,
    this.canvasTColor = Colors.transparent,
    this.canvasFColor = Colors.transparent,
    this.canvasDColor = Colors.black26,
    this.canvasUColor = Colors.black26,
    this.iconTColor = Colors.black,
    this.iconFColor = Colors.black,
    this.iconDColor = Colors.black,
    this.iconUColor = Colors.black,
    this.canvasDisabledColor = Colors.black12,
    this.iconDisabledColor = Colors.black26,
    this.T = Icons.toggle_on_outlined,
    this.F = Icons.toggle_off_outlined,
    this.onUpAction,
    this.onDownAction,
  });

  @override
  void click() {
    gestureDetector.onTapDown?.call(TapDownDetails());
    gestureDetector.onTapUp?.call(TapUpDetails(kind: PointerDeviceKind.touch));
  }

  void reset() {
    try {
      switchBloc.add(Reset());
    } catch (exception) {
      debugPrint("******* reset error *******");
    }
  }

  void enable() {
    try {
      switchBloc.add(Enable());
    } catch (exception) {
      debugPrint("******* enable error *******");
    }
  }

  void disable() {
    try {
      switchBloc.add(Disable());
    } catch (exception) {
      debugPrint("******* disable error *******");
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider<SwitchAdvancedBloc>(
      //create: (_) => SwitchAdvancedBloc(SwitchAdvancedState(SwitchAdvancedStates.off)),
      create: (_) {
        //switchBloc = SwitchAdvancedBloc(SwitchAdvancedState(SwitchAdvancedStates.off));
        return switchBloc;
      },
      child: BlocBuilder<SwitchAdvancedBloc, SwitchAdvancedState>(builder: (context, state) {
        gestureDetector = GestureDetector(
          onTapDown: (_) {
            context.read<SwitchAdvancedBloc>().add(Down(uuid));
            onDownAction?.call();
          },
          onTapUp: (_) {
            context.read<SwitchAdvancedBloc>().add(Up(uuid));
            onUpAction?.call();
          },
          onTapCancel: () {
            context.read<SwitchAdvancedBloc>().add(Reset());
          },
          child: Container(
            width: w_(width),
            height: h_(height),
            color: getCanvasColor(state.state()),
            child: Center(
              child: Icon(getIcon(state.state()),
                  size: h_(height * iconSize(state.state())), color: getIconColor(state.state())),
            ),
          ),
        );
        return gestureDetector;
      }),
    );
  }

  Color? getIconColor(SwitchAdvancedStates state) {
    Color? result = iconFColor;
    switch(state) {
      case SwitchAdvancedStates.off:
        result = iconFColor;
        break;
      case SwitchAdvancedStates.on:
        result = iconTColor;
        break;
      case SwitchAdvancedStates.off2on:
        result = iconUColor;
        break;
      case SwitchAdvancedStates.on2off:
        result = iconDColor;
        break;
      case SwitchAdvancedStates.disabled_off:
      case SwitchAdvancedStates.disabled_on:
        result = iconDisabledColor;
        break;
      default:
    }
    return result;
  }

  double iconSize(SwitchAdvancedStates state) {
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

  IconData? getIcon(SwitchAdvancedStates state) {
    IconData? result = F;
    switch (state) {
      case SwitchAdvancedStates.off:
      case SwitchAdvancedStates.disabled_off:
        result = F;
        break;
      case SwitchAdvancedStates.on:
      case SwitchAdvancedStates.disabled_on:
        result = T;
        break;
      default:
    }
    return result;
  }

  Color? getCanvasColor(SwitchAdvancedStates state) {
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
      case SwitchAdvancedStates.disabled_off:
      case SwitchAdvancedStates.disabled_on:
        result = canvasDisabledColor;
        break;
      default:
    }
    return result;
  }
}
