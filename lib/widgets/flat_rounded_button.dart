import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../SizeConfig.dart';
import '../blocks/button_bloc.dart';
import '../events/switch_events.dart';
import '../states/button_state.dart';
import '../interfaces/i_click.dart';

class FlatRoundedButton extends StatelessWidget implements IClick {
  final String uuid = const Uuid().v4().toString();

  final Color canvasColor;
  final Color canvasPressedColor;
  final Color canvasDisabledColor;
  final Color iconColor;
  final Color iconPressedColor;
  final Color iconDisabledColor;
  final double width;
  final double height;
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;
  final Color borderPressedColor;
  final Color borderDisabledColor;
  final IconData? iconData;
  final IconData? iconDataPressed;
  final VoidCallback? onUpAction;
  final VoidCallback? onDownAction;

  late GestureDetector gestureDetector;

  late ButtonBloc switchBloc;

  FlatRoundedButton({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 4,
    this.borderWidth = 1,
    this.borderColor = Colors.black,
    this.borderPressedColor = Colors.black,
    this.borderDisabledColor = Colors.black,
    this.canvasColor = Colors.transparent,
    this.canvasPressedColor = Colors.transparent,
    this.canvasDisabledColor = Colors.black12,
    this.iconColor = Colors.black,
    this.iconPressedColor = Colors.black,
    this.iconDisabledColor = Colors.black26,
    this.iconData = Icons.toggle_on_outlined,
    this.iconDataPressed = Icons.toggle_off_outlined,
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
    double? borderRadius_ = w_(borderRadius);
    double? borderWidth_ = w_(borderWidth);
    return BlocProvider<ButtonBloc>(
      //create: (_) => SwitchAdvancedBloc(SwitchAdvancedState(SwitchAdvancedStates.off)),
      create: (_) {
        switchBloc = ButtonBloc(ButtonState(ButtonStates.ready));
        return switchBloc;
      },
      child: BlocBuilder<ButtonBloc, ButtonState>(builder: (context, state) {
        gestureDetector = GestureDetector(
          onTapDown: (details) {
            context.read<ButtonBloc>().add(Down(uuid));
            onDownAction?.call();
          },
          onTapUp: (details) {
            context.read<ButtonBloc>().add(Up(uuid));
            onUpAction?.call();
          },
          onTapCancel: () {
            context.read<ButtonBloc>().add(Reset());
          }
          ,
          child: Container(
            width: w_(width),
            height: h_(height),
            decoration: BoxDecoration(
              color: getCanvasColor(state.state()),
              borderRadius: BorderRadius.circular(borderRadius_!),
              border: Border.all(color: getBorderColor(state.state()), width: borderWidth_!),
            ),
            child: Center(
              child: Icon(getIcon(state.state()),
                  size: h_(height * getIconSize(state.state())), color: getIconColor(state.state())),
            ),
          ),
        );
        return gestureDetector;
      }),
    );
  }

  Color? getIconColor(ButtonStates state) {
    Color? result = iconColor;
    switch(state) {
      case ButtonStates.ready:
        result = iconColor;
        break;
      case ButtonStates.pressed:
        result = iconPressedColor;
        break;
      case ButtonStates.disabled:
        result = iconDisabledColor;
        break;
      default:
    }
    return result;
  }

  double getIconSize(ButtonStates state) {
    double result = 0.8;
    switch(state) {
      case ButtonStates.ready:
        result = 0.8;
        break;
      case ButtonStates.pressed:
        result = 0.95;
        break;
      default:
    }
    return result;
  }

  IconData? getIcon(ButtonStates state) {
    IconData? result = iconData;
    switch (state) {
      case ButtonStates.ready:
      case ButtonStates.disabled:
        result = iconData;
        break;
      case ButtonStates.pressed:
        result = iconDataPressed;
        break;
      default:
    }
    return result;
  }

  Color? getCanvasColor(ButtonStates state) {
    Color? result = canvasColor;
    switch(state) {
      case ButtonStates.ready:
        result = canvasColor;
        break;
      case ButtonStates.pressed:
        result = canvasPressedColor;
        break;
      case ButtonStates.disabled:
        result = canvasDisabledColor;
        break;
      default:
    }
    return result;
  }

  getBorderColor(ButtonStates state) {
    Color? result = borderColor;
    switch(state) {
      case ButtonStates.ready:
        result = borderColor;
        break;
      case ButtonStates.pressed:
        result = borderPressedColor;
        break;
      case ButtonStates.disabled:
        result = borderDisabledColor;
        break;
      default:
    }
    return result;
  }

}
