import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'appbar_events.dart';
import 'appbar_state.dart';


class AppBarBloc extends Bloc<AppBarEvent, AppBarState> {

  AppBarBloc(String title, String subtitle, Color color) : super (AppBarState(
      title: title, subtitle: subtitle, color: color)) {

    on<UpdateTitle>((event, emit) {
      debugPrint('UpdateTitle->[${event.title}]');
      emit(AppBarState(
        title: event.title, subtitle: state.subtitle, color: state.color,
      ));
    });

    on<UpdateSubtitle>((event, emit) {
      debugPrint('UpdateSubtitle->[${event.subtitle}]');
      emit(AppBarState(
        title: state.title, subtitle: event.subtitle, color: state.color,
      ));
    });

    on<UpdateColor>((event, emit) {
      debugPrint('UpdateSubtitle->[${event.color}]');
      emit(AppBarState(
        title: state.title, subtitle: state.subtitle, color: event.color,
      ));
    });

  }


}
