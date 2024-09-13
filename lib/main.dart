import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Toggle',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ImageToggle(title: 'Flutter Demo Home Page'),
    );
  }
}

class ImageToggle extends StatefulWidget {
  const ImageToggle({super.key, required this.title});
  final String title;

  @override
  State<ImageToggle> createState() => _ImageToggleState();
}

class _ImageToggleState extends State<ImageToggle> {
  int _counter = 0;
  bool _isCatImage = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _toggleImage() {
    setState(() {
      _isCatImage = !_isCatImage;
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
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 30),
            Image.asset(
              _isCatImage ? 'assets/images/cats.png' : 'assets/images/dog.png',
              width: 500,
              height: 500,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(height: 30), // Space between buttons
          ElevatedButton(
            onPressed: _toggleImage,
            child: const Text('Toggle Image'),
          ),
        ],
      ),
    );
  }
}
