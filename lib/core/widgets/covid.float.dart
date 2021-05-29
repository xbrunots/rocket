import 'package:flutter/cupertino.dart';

class CovidFloatWidget extends StatefulWidget {
  @override
  _CovidFloatWidgetState createState() => _CovidFloatWidgetState();
}

class _CovidFloatWidgetState extends State<CovidFloatWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animateController;

  @override
  void initState() {
    super.initState();

    _animateController =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: (MediaQuery.of(context).size.width / 100 * 85),
        top: -60,
        child: AnimatedBuilder(
          animation: _animateController,
          builder: (_, child) {
            return Transform.rotate(
              angle: _animateController.value * 2,
              child: child,
            );
          },
          child: Container(
            width: 110.0,
            height: 110.0,
            child: Image.asset('lib/assets/images/covid_suave.png',
                fit: BoxFit.cover),
          ),
        ));
  }
}
