import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rocketbase/core/extensions/colors.extensions.dart';
import 'package:rocketbase/core/extensions/null.extentions.dart';
import 'package:rocketbase/core/extensions/text.extentions.dart';
import 'package:rocketbase/core/infrastructure/infrastructure.dart';
import 'package:rocketbase/core/widgets/line.widgets.dart';
import 'package:rocketbase/feature/scheduling/data/model/dto/bundles.dto.dart';

class BundleCardWidget extends StatefulWidget {
  final BundleDto bundle;
  BundleCardWidget({Key? key, required this.bundle}) : super(key: key);

  @override
  _BundleCardWidgetState createState() => _BundleCardWidgetState();
}

class _BundleCardWidgetState extends State<BundleCardWidget> {
  @override
  Widget build(BuildContext context) {
    Color colorTitle =
        ColorParser.fromHex(Setup.of(context)?.config.primaryColor);
    Color subColor = ColorParser.fromHex(Setup.of(context)?.config.labelColor);
    Color backgroundColor =
        ColorParser.fromHex(Setup.of(context)?.config.backgroundColor);

    return Material(
      color: backgroundColor,
      child: InkWell(
        onTap: () {},
        child: Ink(
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: 8,
                    bottom: 8,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(
                          LineIcons.directions,
                          color: subColor,
                          size: 28,
                        ),
                      ),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TruncateText.apply(Strings.safe(widget.bundle.name),
                                style: TextStyle(
                                  color: colorTitle,
                                  fontFamily: 'xpto',
                                  height: 1.2,
                                ),
                                maxlines: 3),
                            TruncateText.apply(Strings.safe(widget.bundle.id),
                                style: TextStyle(
                                    color: subColor,
                                    fontFamily: 'xpto',
                                    height: 1.2,
                                    fontSize: 12),
                                maxlines: 3),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                ),
                child: Line(),
              )
            ],
          )),
        ),
      ),
    );
  }
}
