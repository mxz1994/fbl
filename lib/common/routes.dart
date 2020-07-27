import 'package:fbl/view/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static const String main_page = "main/mainPage";

  static Route findRoutes(RouteSettings setting) {
    String name = setting.name;
    Object obj = setting.arguments;
    return CupertinoPageRoute(builder: (_) {
      return _findPage(name, obj);
    });
  }

  static Widget _findPage(String name, Object object) {
    Widget page;
    switch (name) {
      case main_page:
        page = MainPage();
        break;
    }

    return page;
  }
}
