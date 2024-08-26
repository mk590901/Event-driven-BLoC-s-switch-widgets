import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// DrawingEvent
abstract class AppBarEvent extends Equatable {
  const AppBarEvent();
}

class UpdateTitle extends AppBarEvent {
  final String title;

  const UpdateTitle(this.title);

  @override
  List<Object> get props => [title];
}

class UpdateSubtitle extends AppBarEvent {
  final String subtitle;

  const UpdateSubtitle(this.subtitle);

  @override
  List<Object> get props => [subtitle];
}

class UpdateColor extends AppBarEvent {
  final Color color;

  const UpdateColor(this.color);

  @override
  List<Object> get props => [color];
}
