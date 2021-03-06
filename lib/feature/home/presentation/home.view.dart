import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rocketbase/core/extensions/colors.extensions.dart';
import 'package:rocketbase/core/infrastructure/infrastructure.dart';
import 'package:rocketbase/core/widgets/view.widgets.dart';
import 'package:rocketbase/feature/home/presentation/viewmodel/bundle.viewmodel.dart';
import 'package:rocketbase/feature/home/presentation/widgets/list.bundle.widget.dart';
import 'package:rx_notifier/rx_notifier.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    rxObserver(() {
      print("Items: " + viewModel.bundleList.value.bundles.length.toString());
    });
  }

  var viewModel = BundleViewModel();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: RxBuilder(builder: (_) {
            return ViewDefaultWidget(
              title: "Agendamento",
              subTitle: "Selecione um local para o agendamento",
              progress: viewModel.loadingInProgressValue.value,
              children: [
                Flexible(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 100 * 90,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: TextField(
                        controller: null,
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'xpto',
                            color: ColorParser.fromHex(Setup.of(context)
                                ?.config
                                .editTextContentColor)),
                        decoration: InputDecoration(
                            hintText:
                                "digite para filtrar pontos de vacina????o...",
                            hintStyle: TextStyle(fontSize: 14),
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Icon(
                                LineIcons.search,
                                color: Colors.grey,
                              ), // icon is 48px widget.
                            ),
                            filled: true,
                            fillColor: ColorParser.fromHex(Setup.of(context)
                                ?.config
                                .editTextBackgroundColor),
                            contentPadding: EdgeInsets.only(
                                left: 0.0, bottom: 0.0, top: 0.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: ColorParser.fromHex(Setup.of(context)
                                      ?.config
                                      .editTextBorderFocusColor)),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorParser.fromHex(Setup.of(context)
                                      ?.config
                                      .editTextBackgroundColor)),
                              borderRadius: BorderRadius.circular(24),
                            )),
                        onChanged: (String value) {
                          print("digit: " + value);
                          viewModel.getListLocations(value);
                        },
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Image.asset(
                    'lib/assets/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: RxBuilder(
                      builder: (_) {
                        return BundleListWidget(
                            bundleList: viewModel.bundleList.value);
                      },
                    ),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.dispose();
  }
}
