import 'package:flutter/material.dart';

import 'color.dart';
import 'typography.dart';

var lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  textTheme: textTheme,
);

extension Util on BuildContext {
  ColorScheme colors() {
    return Theme.of(this).colorScheme;
  }

  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}