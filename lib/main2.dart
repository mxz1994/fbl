import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  _build() {}
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Cupertino App',
      home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('Cupertino App Bar'),
          ),
          child: ListView.builder(
              itemCount: 100,
              itemExtent: 50,
              itemBuilder: (BuildContext context, int index) => ListTile(
                    title: Text('title $index'),
                    subtitle: Text('body $index'),
                  ))),
    );
  }
}
