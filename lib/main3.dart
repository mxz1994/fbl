import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  Widget _buildStack() {
    return Stack(
      alignment: const Alignment(0.6, -0.8),
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/aa.jpg'),
          radius: 100,
        ),
        Container(
          decoration: BoxDecoration(color: Colors.black45),
          child: Text(
            'Mar',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildCard() {
    return SizedBox(
      height: 210,
      width: 420,
      child: Card(
        elevation: 8,
        child: Column(
          children: [
            ListTile(
              title: Text('111dfd121111112221111',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text(" my cidty"),
              leading: Icon(
                Icons.restaurant_menu,
                color: Colors.blue[500],
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                'ssssssssssssssssssss',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: Icon(
                Icons.contact_phone,
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text("8373227@qq.com"),
              leading: Icon(
                Icons.contact_mail,
                color: Colors.blue[500],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var packRow = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.star,
          color: Colors.green[500],
        ),
        Icon(
          Icons.star,
          color: Colors.green[500],
        ),
        Icon(
          Icons.star,
          color: Colors.green[500],
        ),
        Icon(Icons.star),
        Icon(Icons.star)
      ],
    );

    var desc = Text('170 Reviews',
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontFamily: 'Roboto',
            letterSpacing: 0.5,
            fontSize: 20));

    var ratings = Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          packRow,
        ],
      ),
    );

    var s = Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [packRow, desc],
        )));

    return MaterialApp(
        title: "welcome to flutter",
        theme: ThemeData(primaryColor: Colors.white),
        home: Scaffold(
            appBar: AppBar(title: Text("sadas")),
            body: Center(
              child: TextButton(),
            )));
  }

  Widget _buildState() {
    return Container(child: Text("sd"));
  }
}

class TextButton extends StatefulWidget {
  @override
  _TextButtonState createState() => _TextButtonState();
}

class _TextButtonState extends State<TextButton> {
  int _count = 0;
  _increment() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [CountDisplay(_count), CountButton(_increment)],
    );
  }
}

class CountDisplay extends StatelessWidget {
  final int count;
  @override
  Widget build(BuildContext context) {
    return Text("count $count");
  }

  CountDisplay(this.count);
}

class CountButton extends StatelessWidget {
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("aaaaaaaaaa"),
      onPressed: onPressed,
    );
  }

  CountButton(this.onPressed);
}
