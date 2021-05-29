import 'package:flutter/material.dart';
import 'package:rocketbase/core/infrastructure/infrastructure.dart';
import 'feature/home/presentation/home.view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Setup(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AppDock',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeView(),
      ),
    );
  }
}
