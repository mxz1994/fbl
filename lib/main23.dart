import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() => runApp(Notification());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fbl',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage2(title: '这是'),
    );
  }
}

class Notification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ScrollController Demo',
        home: Scaffold(
            appBar: AppBar(title: Text('ScrollController Demo')),
            body: NotificationListener<ScrollNotification>(
              // 添加 NotificationListener 作为父容器
              onNotification: (scrollNotification) {
                // 注册通知回调
                if (scrollNotification is ScrollStartNotification) {
                  // 滚动开始
                  print('Scroll Start');
                } else if (scrollNotification is ScrollUpdateNotification) {
                  // 滚动位置更新
                  print('Scroll Update');
                } else if (scrollNotification is ScrollEndNotification) {
                  // 滚动结束
                  print('Scroll End');
                }
              },
              child: ListView.builder(
                itemCount: 30, // 列表元素个数
                itemBuilder: (context, index) =>
                    ListTile(title: Text("Index : $index")), // 列表项创建方法
              ),
            )));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class MyHomePage2 extends StatefulWidget {
  MyHomePage2({Key key, this.title}) : super(key: key);
  final String title;

  @override
  MyAPPState createState() => MyAPPState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget buildListView() {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.map),
          title: Text("map"),
        ),
        ListTile(leading: Icon(Icons.mail), title: Text('Mail')),
        ListTile(leading: Icon(Icons.message), title: Text('Message')),
      ],
    );
  }

  Widget buildListView2() {
    return ListView.builder(
        itemCount: 100,
        itemExtent: 50,
        itemBuilder: (BuildContext context, int index) => ListTile(
            title: Text('title $index'), subtitle: Text('body $index')));
  }

  Widget buildListView3() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text('text'),
          floating: true,
          flexibleSpace: Image.asset(
            "aa.jpg",
            fit: BoxFit.cover,
          ),
          expandedHeight: 300,
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) => ListTile(title: Text('dddItem #$index')),
          childCount: 100,
        ))
      ],
    );
  }

  Widget buildListView4() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text('text'),
          floating: true,
          flexibleSpace: Image.asset(
            "aa.jpg",
            fit: BoxFit.cover,
          ),
          expandedHeight: 300,
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) => ListTile(title: Text('dddItem #$index')),
          childCount: 100,
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: buildListView3()),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyAPPState extends State<MyHomePage2> {
  ScrollController _controller; //ListView 控制器
  bool isToTop = false; // 标示目前是否需要启用 "Top" 按钮
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(() {
      // 为控制器注册滚动监听方法
      if (_controller.offset > 1000) {
        // 如果 ListView 已经向下滚动了 1000，则启用 Top 按钮
        setState(() {
          isToTop = true;
        });
      } else if (_controller.offset < 300) {
        // 如果 ListView 向下滚动距离不足 300，则禁用 Top 按钮
        setState(() {
          isToTop = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: ListView.builder(
        controller: _controller, // 初始化传入控制器
        itemCount: 100, // 列表元素总数
        itemBuilder: (context, index) =>
            ListTile(title: Text("Index : $index")), // 列表项构造方法
      )),
      floatingActionButton: RaisedButton(
        onPressed: (isToTop
            ? () {
                if (isToTop) {
                  _controller.animateTo(.0,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.ease); // 做一个滚动到顶部的动画
                }
              }
            : null),
        child: Text("Top"),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // 销毁控制器
    super.dispose();
  }
}
