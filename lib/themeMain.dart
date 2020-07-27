import 'package:cached_network_image/cached_network_image.dart';
import 'package:fbl/ListItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "asa",
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue,
          accentColor: Colors.cyan),
      home: Scaffold(
          appBar: AppBar(
            title: Text("ssss"),
          ),
          body: Container(child: _buildListView())),
    );
  }

  Widget _buildGridView() {
    return GridView.count(
        crossAxisCount: 2,
        children: List.generate(
            100,
            (index) => Center(
                  child: Text('$index'),
                )));
  }

  Widget _buildListView() {
    final items = List<ListItem>.generate(
        10000,
        (index) => index % 6 == 0
            ? HeadingItem("Heading$index")
            : MessageItem("sender $index", "MessageBody $index"));
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          if (item is HeadingItem) {
            return ListTile(
              title: Text(
                item.heading,
                style: Theme.of(context).textTheme.headline,
              ),
            );
          } else if (item is MessageItem) {
            return Dismissible(
                key: Key(item.sender),
                onDismissed: (direction) {
                  items.removeAt(index);
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("$item dissmissed"),
                  ));
                },
                child: ListTile(
                  title: Text(
                    item.sender,
                  ),
                  subtitle: Text(item.body),
                ));
          }
          return ListTile(
            title: Text(''),
          );
        });
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        new Container(
          width: 160,
          color: Colors.red,
        ),
        new Container(
          width: 160,
          color: Colors.white,
        ),
        new Container(
          width: 160,
          color: Colors.green,
        ),
        new Container(
          width: 160,
          color: Colors.yellow,
        )
      ],
    );
  }

  Widget _buildImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.network(
            "https://dss2.bdstatic.com/6Ot1bjeh1BF3odCf/it/u=2227729111,177869449&fm=85&app=92&f=JPEG?w=121&h=75&s=81A2FD175D0350CE4E61C17203004033"),
        CachedNetworkImage(
          imageUrl:
              "https://dss2.bdstatic.com/6Ot1bjeh1BF3odCf/it/u=2227729111,177869449&fm=85&app=92&f=JPEG?w=121&h=75&s=81A2FD175D0350CE4E61C17203004033",
        ),
      ],
    );
  }
}
