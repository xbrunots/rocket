import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rocketbase/core/extensions/colors.extensions.dart';
import 'package:rocketbase/core/infrastructure/infrastructure.dart';

class Line extends StatefulWidget {
  Line({Key? key}) : super(key: key);

  @override
  _LineState createState() => _LineState();
}

class _LineState extends State<Line> {
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: ColorParser.fromHex(Setup.of(context)?.config.lineColor),
    );
  }
}
