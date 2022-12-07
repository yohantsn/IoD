import 'package:example/data/persistence.dart';
import 'package:example/domain/register_logic.dart';
import 'package:flutter/material.dart';
import 'package:iod/iod.dart';

void main() {
  IoD.register<IPersistence>(Persistence());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        controller: RegisterLogic(
          IoD.read<IPersistence>(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final RegisterLogic controller;
  const MyHomePage({super.key, required this.title, required this.controller});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "";

  @override
  void initState() {
    super.initState();

    widget.controller.saveText("Working");
  }

  void readText() {
    setState(() {
      text = widget.controller.readText();
    });
  }

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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: readText,
        tooltip: 'Read',
        child: const Icon(Icons.read_more),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
