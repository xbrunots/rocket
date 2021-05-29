import 'package:flutter/widgets.dart';

extension TruncateText on Text {
  static Text apply(String text, {int? maxlines, TextStyle? style}) {
    return Text(text,
        maxLines: maxlines,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: style);
  }
}
