import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  IconButtonThemeData get iconTheme => Theme.of(this).iconButtonTheme;

  InputDecorationTheme get inputDecorationTheme =>
      Theme.of(this).inputDecorationTheme;
}