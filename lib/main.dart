import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rendering',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), 
      home: MyHomePage(
        title: ' CONDITIONAL RENDERING',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 152, 215, 219),
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade400,
        titleTextStyle: TextStyle(color: Colors.black),
        title: Center(
          child: Text(
            widget.title,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // back
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Conditional.single(
                context: context,
                conditionBuilder: (BuildContext context) => _counter % 2 == 0,
                widgetBuilder: (BuildContext context) {
                  return Column(
                    children: <Widget>[
                      const Text(
                        'The number is even.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Icon(
                        Icons.check,
                        size: 60.0,
                        color: Color.fromARGB(255, 49, 134, 52),
                      ),
                    ],
                  );
                },
                fallbackBuilder: (BuildContext context) {
                  return Column(
                    children: <Widget>[
                      const Text(
                        'The number is not even.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Icon(
                        Icons.close,
                        size: 60.0,
                        color: Colors.red,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        backgroundColor: Colors.yellow.shade400,
        tooltip: 'Increment',
        child: const Icon(Icons.add, color: Color.fromARGB(255, 18, 24, 23)),
      ),
    );
  }
}
