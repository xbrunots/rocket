import 'package:flutter/material.dart';

import 'config.dart';

// ignore: must_be_immutable
class Setup extends InheritedWidget {
  Config config = Config(primaryColor: "#222B45", lineColor: "#EBEBEB");

  Setup({
    required Widget child,
  }) : super(child: child);

  static Setup? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Setup>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
