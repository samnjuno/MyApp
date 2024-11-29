import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My App'),
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
  dynamic _name = '';

  void _printName() {
    setState(() {
      print('Hello $_name. How are you today?');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Enter your name and push the button:',
            ),
            TextFormField(
                decoration: InputDecoration(labelText: 'Enter you name'),
                validator: (value) {
                  if (value == null) {
                    setState(() {
                      decoration:
                      InputDecoration(labelText: 'Enter you name');
                    });
                  }
                  return null;
                },
                onChanged: (value) {
                  _name = value;
                }),
            Text(
              '$_name',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const RoundedRectangleBorder(
            side: BorderSide(width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(25))),
        onPressed: _printName,
        tooltip: 'click to print name',
        child: const Text('Click Me'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
