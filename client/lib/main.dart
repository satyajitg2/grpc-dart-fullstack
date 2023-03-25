import 'package:flutter/material.dart';
import 'package:protobuf/protobuf.dart';
import 'package:protos/protos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ClientChannel _channel;
  late TodoServiceClient _stub;

  Todo? todo;

  @override
  void initState() {
    super.initState();

    _channel = ClientChannel('localhost',
        port: 8080,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()));
    _stub = TodoServiceClient(_channel);
  }

  void _getTodo() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (todo != null)
              Column(
                children: [
                  Text(todo!.id.toString()),
                  Text(todo!.title),
                  Text(todo!.completed.toString()),
                ],
              )
            else
              Text('GET your TODo'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getTodo,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
