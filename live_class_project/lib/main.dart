import 'package:flutter/material.dart';

// Image(asset, network), Column, Row

void main() {
  runApp(HelloWorldApp());
}

class HelloWorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Hello World App',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                shadowColor: Colors.amber,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  // side: BorderSide(color: Colors.green, width: 4)
                ),
                side: BorderSide(color: Colors.green, width: 4),
                minimumSize: Size(100, 40),
                // maximumSize: Size(300, 100),
              ),
              onPressed: () {
                showDialog(
                  barrierColor: Colors.green,
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Delete'),
                      content: Text('Are you sure?'),
                      actions: [
                        TextButton(onPressed: () {}, child: Text('No')),
                        TextButton(onPressed: () {}, child: Text('Yes')),
                      ],
                    );
                  },
                );
              },
              child: Text('Tap'),
            ),
            SizedBox(height: 16),
            TextButton(
              style: TextButton.styleFrom(),
              onPressed: () {
                print('Tapped text button');
              },
              child: Text('Tap here'),
            ),
            SizedBox(height: 16),
            IconButton(
              style: IconButton.styleFrom(),
              onPressed: () {
                print('Tapped text button');
              },
              icon: Icon(Icons.add),
            ),
            SizedBox(height: 16),
            OutlinedButton(
              style: OutlinedButton.styleFrom(),
              onPressed: () {
                print('Tapped text button');
              },
              child: Text('Click here'),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                print('Just one click');
              },
              onDoubleTap: () {
                print('Double tapped');
              },
              onLongPress: () {
                print('On long press');
              },
              onLongPressCancel: () {
                print('On long press cancel');
              },
              onLongPressEnd: (details) {
                print('On long press end');
              },
              child: Column(
                children: [
                  Text('Simple Text'),
                  Text('Simple Text'),
                  Text('Simple Text'),
                  Text('Simple Text'),
                ],
              ),
            ),
            InkWell(
              splashColor: Colors.green,
              onTap: () {
                print('Ink well');
              },
              child: Text('Behave like button'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
