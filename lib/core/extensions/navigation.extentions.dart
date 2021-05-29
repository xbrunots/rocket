import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//SignupView().Navigate()

class PageRouter extends InheritedWidget {
  PageRouter({Key? key, child: Widget}) : super(key: key, child: child);

  static PageRouter? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PageRouter>();
  }

  static PageRouter? navigate(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  // ignore: dead_code
  @override
  bool updateShouldNotify(PageRouter oldWidget) => true;
}
