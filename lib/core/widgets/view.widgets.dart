import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rocketbase/core/extensions/colors.extensions.dart';
import 'package:rocketbase/core/infrastructure/infrastructure.dart';

import 'bouncing.widgets.dart';
import 'line.widgets.dart';

class ViewDefaultWidget extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final bool? progress;
  final List<Widget>? children;

  const ViewDefaultWidget(
      {Key? key, this.title, this.subTitle, this.children, this.progress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color shadowColor =
        ColorParser.fromHex(Setup.of(context)?.config.cardShadowColor);

    Color backgroundColor =
        ColorParser.fromHex(Setup.of(context)?.config.backgroundColor);

    Color primaryColor =
        ColorParser.fromHex(Setup.of(context)?.config.primaryColor);

    var myTitle = title == null ? "" : title;

    return Container(
      color: backgroundColor,
      child: Flexible(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Container(
                height: 60,
                color: backgroundColor,
                child: Container(
                  color: backgroundColor,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Bouncing(
                          onPress: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            LineIcons.arrowLeft,
                            color: Colors.black,
                            size: 32,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          color: backgroundColor,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    myTitle!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      backgroundColor: Colors.transparent,
                                      height: 1.1,
                                      color: ColorParser.fromHex(
                                          Setup.of(context)
                                              ?.config
                                              .primaryColor),
                                    ),
                                  ),
                                  subTitle == null
                                      ? Container()
                                      : Text(
                                          subTitle!,
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            backgroundColor: Colors.transparent,
                                            height: 1.1,
                                            fontSize: 14,
                                            color: ColorParser.fromHex(
                                                Setup.of(context)
                                                    ?.config
                                                    .primaryColor),
                                          ),
                                        ),
                                ]),
                          ),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 12,
                            top: 12,
                            right: 12,
                            bottom: 12,
                          ),
                          child: progress == true
                              ? CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      primaryColor),
                                  backgroundColor: backgroundColor,
                                )
                              : Container(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Line(),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: children!,
              ),
            )
          ],
        ),
      ),
    );
  }
}
