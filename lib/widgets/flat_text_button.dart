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

class FlatTextButton extends StatelessWidget implements IClick {
  final String uuid = const Uuid().v4().toString();

  final Color canvasColor;
  final Color canvasPressedColor;
  final Color canvasDisabledColor;
  final Color textColor;
  final Color textPressedColor;
  final Color textDisabledColor;
  late String text;
  //final String textPressed;
  final String textDisabled;
  final double width;
  final double height;
  final double fontSize;
  final FontStyle fontStyle;
  final VoidCallback? onUpAction;
  final VoidCallback? onDownAction;

  late GestureDetector gestureDetector;

  final ButtonBloc buttonBloc = ButtonBloc(ButtonState(ButtonStates.ready));

  FlatTextButton({
    super.key,
    required this.width,
    required this.height,
    this.canvasColor = Colors.transparent,
    this.canvasPressedColor = Colors.transparent,
    this.canvasDisabledColor = Colors.black12,
    this.text = "text",
    //this.textPressed = "pressed",
    this.textDisabled = "disabled",
    this.textColor = Colors.black,
    this.textPressedColor = Colors.black,
    this.textDisabledColor = Colors.black26,
    this.fontSize = 16,
    this.fontStyle = FontStyle.normal,
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
      buttonBloc.add(Reset());
    } catch (exception) {
      debugPrint("******* reset error *******");
    }
  }

  void enable() {
    try {
      buttonBloc.add(Enable());
    } catch (exception) {
      debugPrint("******* enable error *******");
    }
  }

  void disable() {
    try {
      buttonBloc.add(Disable());
    } catch (exception) {
      debugPrint("******* disable error *******");
    }
  }

  void changeText(final String text) {
    try {
      this.text = text;
      buttonBloc.add(ChangeText());
    } catch (exception) {
      debugPrint("* change error * ${exception.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider<ButtonBloc>(
      create: (_) {
        return buttonBloc;
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
          },
          child: Container(
            width: w_(width),
            height: h_(height),
            decoration: BoxDecoration(
              color: getCanvasColor(state.state()),
             ),
            child: Center(
              child: Text(getText(state.state()), style: TextStyle(
        color: getTextColor(state.state()),
                fontSize: fontSize,
                fontStyle: fontStyle,),
              ),
            ),
          ),
        );
        return gestureDetector;
      }),
    );
  }

  String getText(ButtonStates state) {
    String result = "";
    switch(state) {
      case ButtonStates.ready:
        result = text;
        break;
      case ButtonStates.pressed:
        result = text;//textPressed;
        break;
      case ButtonStates.disabled:
        result = textDisabled;
        break;
      default:
    }
    return result;
  }
  
  Color? getTextColor(ButtonStates state) {
    Color? result = textColor;
    switch(state) {
      case ButtonStates.ready:
        result = textColor;
        break;
      case ButtonStates.pressed:
        result = textPressedColor;
        break;
      case ButtonStates.disabled:
        result = textDisabledColor;
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
}
