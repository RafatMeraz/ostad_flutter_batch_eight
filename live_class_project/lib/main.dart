import 'package:flutter/material.dart';

// reformat
// ctl + shift + l // cmd + shift + l

// suggestion
// ctl + space

// var, dynamic

void main() {
  runApp(HelloWorldApp());
}

class HelloWorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Hello World App',
      home: Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: Text('Home'),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            'Hello World we are writing our first application code with flutter',
            textAlign: TextAlign.justify,
            maxLines: 1,
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.8,
              height: 1.5,
              // backgroundColor: Colors.black,
              wordSpacing: 1,
              // decoration: TextDecoration.lineThrough,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
