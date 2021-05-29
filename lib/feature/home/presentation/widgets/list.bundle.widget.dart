import 'package:flutter/widgets.dart';
import 'package:rocketbase/core/extensions/colors.extensions.dart';
import 'package:rocketbase/core/infrastructure/infrastructure.dart';
import 'package:rocketbase/feature/home/data/model/dto/bundles.dto.dart';
import 'package:rocketbase/feature/home/presentation/widgets/card.bundle.widget.dart';

class BundleListWidget extends StatefulWidget {
  final BundleListDto bundleList;

  BundleListWidget({Key? key, required this.bundleList}) : super(key: key);

  @override
  _BundleListWidgetState createState() => _BundleListWidgetState();
}

class _BundleListWidgetState extends State<BundleListWidget> {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor =
        ColorParser.fromHex(Setup.of(context)?.config.backgroundColor);

    return Flexible(
      child: Container(
        color: backgroundColor,
        height: MediaQuery.of(context).size.height - 180,
        width: MediaQuery.of(context).size.width,
        child: widget.bundleList.bundles.isNotEmpty
            ? ListView.builder(
                itemCount: widget.bundleList.bundles.length,
                physics: BouncingScrollPhysics(),
                // This next line does the trick.
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext ctxt, int i) {
                  return BundleCardWidget(bundle: widget.bundleList.bundles[i]);
                })
            : Container(),
      ),
    );
  }
}
