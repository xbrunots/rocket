import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';

extension ColorParser on Color {
  static Color fromHex(String? hexString) {
    if (hexString == null) {
      return Colors.pink;
    }
    return HexColor(hexString);
  }
}
