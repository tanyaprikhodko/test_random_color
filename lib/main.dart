import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandomColorScreen(),
    );
  }
}

class RandomColorScreen extends StatefulWidget {
  @override
  _RandomColorScreenState createState() => _RandomColorScreenState();
}

class _RandomColorScreenState extends State<RandomColorScreen> {
  // init random generator with seed using time epoch
  final _randomGenerator =
      new Random(new DateTime.now().millisecondsSinceEpoch);
  Color _containerColor;

  _RandomColorScreenState() {
    // set random color on each app run
    _containerColor = getRandomColor();
  }

  void changeColor() {
    setState(() {
      _containerColor = getRandomColor();
    });
  }

  // generate random golor using rgbo, opacity is always 1, but can be generated too
  Color getRandomColor() {
    return Color.fromRGBO(_randomGenerator.nextInt(256),
        _randomGenerator.nextInt(256), _randomGenerator.nextInt(256), 1);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('Test App')),
      body: GestureDetector(
          onTap: changeColor,
          child: Container(
            decoration: BoxDecoration(color: _containerColor),
            child: Center(
              child: Text('Hey there'),
            ),
          )),
    ));
  }
}
