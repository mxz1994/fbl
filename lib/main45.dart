import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp2());
//markdown
class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "fbl",
      home: Scaffold(
        appBar: AppBar(
          title: Text("aaaaaaaaa"),
        ),
        body: MyApp(),
      ),
    );
  }
}

class TextInput extends StatefulWidget {
  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final TextEditingController _controller = TextEditingController();

  void _li() {
    if (_controller.text == "ma") {
      setState(() {
        _controller.text = "maxingzheng";
      });
    }
  }

  @override
  void initState() {
    _controller.addListener(_li);
  }

  void dispose() {
    _controller.removeListener(_li);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(hintText: "hello flutter"),
        ),
        RaisedButton(
          onPressed: () {
            showDialog(
                context: context,
                child: AlertDialog(
                  title: Text("whatyou"),
                  content: Text(_controller.text),
                ));
          },
          child: Text("Done"),
        )
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todos = List.generate(
        20,
        (index) =>
            Todo('TODO $index', "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa$index"));

    return MaterialApp(
      title: "sadas",
      home: TodosScreen(
        todos: todos,
      ),
    );
  }
}

class TodosScreen extends StatelessWidget {
  final List<Todo> todos;

  TodosScreen({Key key, @required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("aaaaaaaaa"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(
                            todo: todos[index],
                          )));
            },
          );
        },
        itemCount: todos.length,
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Todo todo;

  DetailScreen({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${todo.title}"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text(todo.desc),
      ),
    );
  }
}

class Todo {
  final String title;
  final String desc;
  Todo(this.title, this.desc);
}
