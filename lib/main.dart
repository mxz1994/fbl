import 'package:fbl/common/routes.dart';
import 'package:fbl/view/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateInitialRoutes: (setting) {
        return Routes.findRoutes(setting);
      },
      home: SplashPage(),
    );
  }
}
