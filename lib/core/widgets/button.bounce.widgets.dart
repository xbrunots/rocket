import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rocketbase/core/extensions/colors.extensions.dart';
import 'package:rocketbase/core/widgets/bouncing.widgets.dart';

// ignore: must_be_immutable
// ignore: unnecessary_null_comparison
class ButtonBounce extends StatefulWidget {
  final String? backgroundColor;
  final String? color;
  final IconData? icon;
  final String? text;
  final bool? loading;
  final double? borderRadius;
  final double? width;
  final double? height;
  final double? padding;
  final double? fontSize;

  const ButtonBounce(
      {Key? key,
      this.backgroundColor,
      this.color,
      this.icon,
      this.text,
      this.loading,
      this.borderRadius,
      this.width,
      this.height,
      this.padding,
      this.fontSize})
      : super(key: key);

  @override
  _ButtonBounceState createState() => _ButtonBounceState();
}

class _ButtonBounceState extends State<ButtonBounce>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  double? defaultHeight() => widget.height == null ? 60 : widget.height;
  double? defaultWidth() => widget.width == null
      ? (MediaQuery.of(context).size.width * 0.90)
      : widget.width;
  double? defaultFontSize() => widget.fontSize == null ? 14 : widget.fontSize;
  double? defaultPadding() => widget.padding == null ? 14 : widget.padding;

  @override
  Widget build(BuildContext context) {
    return Bouncing(
      onPress: () {},
      child: widget.loading == true
          ? Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(
                      ColorParser.fromHex(widget.backgroundColor)),
                  backgroundColor: Colors.white,
                ),
              ),
            )
          : AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: widget.loading == true ? defaultHeight() : defaultWidth(),
              height: defaultHeight(),
              decoration: widget.loading == true
                  ? BoxDecoration(
                      color: ColorParser.fromHex("#FFFFFF"),
                      borderRadius: BorderRadius.circular(
                          (widget.borderRadius == null
                              ? 38.0
                              : widget.borderRadius)!),
                      boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ])
                  : BoxDecoration(
                      color: widget.backgroundColor == null
                          ? ColorParser.fromHex("#FFFFFF")
                          : ColorParser.fromHex(widget.backgroundColor),
                      borderRadius: BorderRadius.circular(
                          (widget.borderRadius == null
                              ? 38.0
                              : widget.borderRadius)!)),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                widget.icon == null
                    ? Container()
                    : Positioned(
                        left: 0,
                        child: Icon(
                            widget.icon == null
                                ? LineIcons.goodreadsG
                                : widget.icon,
                            size: (defaultFontSize() ?? 1) * 2,
                            color: widget.color == null
                                ? ColorParser.fromHex("#000000")
                                : ColorParser.fromHex(widget.color)),
                      ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(defaultPadding() ?? 0),
                    child: Text(
                      (widget.text == null ? "ENTRAR" : widget.text) ?? "",
                      style: TextStyle(
                        fontFamily: 'Saira',
                        fontWeight: FontWeight.w600,
                        fontSize: defaultFontSize(),
                        color: widget.color == null
                            ? ColorParser.fromHex("#000000")
                            : ColorParser.fromHex(widget.color),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ]),
            ),
    );
  }
}
