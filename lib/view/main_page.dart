import 'package:fbl/base/provider_widget.dart';
import 'package:fbl/viewmodel/theaters_viewmodel.dart';
import 'package:fbl/widget/douban_appbar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
//    await Http.get(Urls.theaters, {}, success: (dynamic json) {
//      print(jsonEncode(json).toString());
//    }, fail: (reason, code) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DouBanAppBar("首页", false).build(context),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProviderWidget<TheatersViewModel>(
                  model: TheatersViewModel(),
                  onReady: (model) {
                    model.load();
                  },
                  builder: (context, model, child) {
                    return Text("aa");
                  })
            ],
          ),
        ),
      ),
    );
  }
}
