import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppBarState extends Equatable {
  final String title;
  final String subtitle;
  final Color color;

  const AppBarState({required this.title, required this.subtitle, required this.color});

  @override
  List<Object?> get props => [title, subtitle, color];
}