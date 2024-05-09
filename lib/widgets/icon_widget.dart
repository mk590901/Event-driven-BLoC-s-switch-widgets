import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../SizeConfig.dart';
import '../blocks/button_bloc.dart';
import '../events/button_events.dart';
import '../states/button_state.dart';

class IconTileWidget extends StatelessWidget {

  final String uuid = const Uuid().v4().toString();

  final Color tileColor;
  final Color iconColor;

  IconTileWidget({
    super.key,
    required this.tileColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  BlocProvider<ButtonBloc>(
      create: (_) => ButtonBloc(ButtonState(ButtonStates.stop)),
      child:
        BlocBuilder<ButtonBloc, ButtonState>(builder: (context, state) {

          return GestureDetector(
            onTap: () {
              // Handle onTap event here
              // For example, you can dispatch an event to the Bloc
              // context.read<YourBloc>().add(YourEvent());
              context.read<ButtonBloc>().add(Click.ext(uuid));
            },
            child: Container(
              color: tileColor,
              child: Center(
                child: Icon(
                    state.state().name == 'stop'
                        ? Icons.play_arrow_sharp
                        : Icons.pause_sharp,
                    size: h_(16),
                    color: iconColor),
              ),
            ), // Your widget to rebuild based on state
          );
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
