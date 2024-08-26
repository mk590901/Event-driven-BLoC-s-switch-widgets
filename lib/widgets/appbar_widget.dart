import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../application_bar/appbar_bloc.dart';
import '../application_bar/appbar_events.dart';
import '../application_bar/appbar_state.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  final String subtitle;
  final Color color;

  late AppBarBloc appBarBloc;

  AppBarWidget({super.key, required this.title, required this.subtitle, required this.color}) {
    appBarBloc = AppBarBloc(title, subtitle, color);
  }

  void replaceSubtitle(String text) {
    appBarBloc.add(UpdateSubtitle(text));
  }

  void changeColor(Color color) {
    appBarBloc.add(UpdateColor(color));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBarBloc>(
      create: (_) {
        return appBarBloc;
      },
      child: BlocBuilder<AppBarBloc, AppBarState>(
        builder: (context, state) {
          return AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(state.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      shadows: [
                        Shadow(
                          blurRadius: 8.0,
                          color: Colors.indigo,
                          offset: Offset(3.0, 3.0),
                        ),
                      ],
                    )),
                Text(state.subtitle,
                    style: const TextStyle(color: Colors.white, fontSize: 12, fontStyle: FontStyle.italic,)),
              ],
            ),
            leading: IconButton(
              icon: const Icon(Icons.extension_outlined, color: Colors.white),
              // Icon widget
              onPressed: () {
                changeColor(Colors.red);
                Future.delayed(const Duration(seconds: 2), () {
                  changeColor(color);
                });
              },
            ),
            backgroundColor: state.color,
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0); // Adjust height as needed
}