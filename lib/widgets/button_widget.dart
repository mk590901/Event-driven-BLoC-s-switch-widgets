import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../SizeConfig.dart';
import '../blocks/button_bloc.dart';
import '../events/button_events.dart';
import '../interfaces/i_done.dart';
import '../states/button_state.dart';

class ButtonWidget extends StatelessWidget implements IDone {
  final String uuid = const Uuid().v4().toString();

  final Color backgroundColor;
  final Color foregroundColor;
  final double width;
  final double height;
  final IconData? T;
  final IconData? F;
  //final IDone? iDone;
  final VoidCallback? onAction;

  late GestureDetector gestureDetector;

  ButtonWidget({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.width,
    required this.height,
    required this.T,
    required this.F,
    //required this.iDone,
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
    return BlocProvider<ButtonBloc>(
      create: (_) => ButtonBloc(ButtonState(ButtonStates.stop)),
      child: BlocBuilder<ButtonBloc, ButtonState>(builder: (context, state) {
        //GestureDetector
          gestureDetector = GestureDetector(
          onTap: () {
            context.read<ButtonBloc>().add(Click.ext(uuid));
            onAction?.call();
          },
          child: SizedBox(
            width: w_(width),
            height: h_(height),
            child: Container(
              color: backgroundColor,
              child: Center(
                child: Icon(
                    state.state().name == 'stop'
                        ? F //Icons.play_arrow_sharp
                        : T, //Icons.pause_sharp,
                    size: h_(height * 0.95),
                    color: foregroundColor),
              ),
            ), // Your widget to rebuild based on state
          ),
        );

        return gestureDetector;

        // return GestureDetector(
        //   onTap: () {
        //     context.read<ButtonBloc>().add(Click.ext(uuid));
        //     onAction?.call();
        //   },
        //   child: SizedBox(
        //     width: w_(width),
        //     height: h_(height),
        //     child: Container(
        //       color: backgroundColor,
        //       child: Center(
        //         child: Icon(
        //             state.state().name == 'stop'
        //                 ? F //Icons.play_arrow_sharp
        //                 : T, //Icons.pause_sharp,
        //             size: h_(height * 0.95),
        //             color: foregroundColor),
        //       ),
        //     ), // Your widget to rebuild based on state
        //   ),
        // );
        //



      }),
    );
  }
}

/*
class IconTileWidget extends StatelessWidget {

  final String uuid = const Uuid().v4().toString();

  bool _startStop = false;
  final Color tileColor;
  final Color iconColor;

  IconTileWidget({
    Key? key,
    required this.tileColor,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  BlocProvider<ButtonBloc>(
      create: (_) => ButtonBloc(ButtonState(ButtonStates.stop)),
      child: GestureDetector(
        onTap: () {
          //@context.read<ButtonBloc>().add(Click.ext(uuid));
          // _startStop = !_startStop;
          // if (_startStop) {
          //   obtain.start(uuid);
          // }
          // else {
          //   obtain.stop(uuid);
          // }
        },
        child:
          BlocBuilder<ButtonBloc, ButtonState>(builder: (context, state) {

            return Container(
              color: tileColor,
              child: Center(
                child: Icon(
                    state.state().name == 'stop'
                        ? Icons.play_arrow_sharp
                        : Icons.pause_sharp,
                    size: h_(12),
                    color: iconColor),
              ),
            );
        }),
      ),
    );
  }
}
*/

/*
class IconTileWidget extends StatelessWidget {
  IconTileWidget({
    Key? key,
    required this.tileColor,
    required this.iconColor,
  }) : super(key: key);

  final String uuid = const Uuid().v4().toString();
  final Color tileColor;
  final Color iconColor;


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Listener(
        onPointerDown: (e) {
          //print('Down  [$uuid]');
        },
        onPointerMove: (e) {
          //print('Move  [$$uuid]');
        },
        onPointerUp: (e) {
          //print('Up    [$uuid]');
          context.read<ButtonBloc>().add(Click.ext(uuid));
        },
        onPointerCancel: (e) {
          //print('Cancel [$uuid]');
        },
        child: BlocBuilder<ButtonBloc, ButtonState>(builder: (context, state) {
          return Container(
            color: tileColor,
            child: Center(
              child: Icon(
                  state.state().name == 'stop'
                      ? Icons.play_arrow_sharp
                      : Icons.pause_sharp,
                  size: h_(12),
                  color: iconColor),
            ),
          );
        }),
      ),
    );
  }




}


 */
