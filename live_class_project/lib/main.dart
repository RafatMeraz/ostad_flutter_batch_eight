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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          centerTitle: true,
        ),
        // body: Image.asset(
        //   'assets/images/shoe.jpg',
        //   width: 300,
        //   height: 400,
        //   fit: BoxFit.scaleDown,
        //   // color: Colors.red.shade50,
        //   alignment: Alignment.bottomCenter,
        // ),
        // body: Image.network(
        //   'https://t3.ftcdn.net/jpg/06/12/00/18/360_F_612001823_TkzT0xmIgagoDCyQ0yuJYEGu8j6VNVYT.jpg',
        //   width: 200,
        //   height: 300,
        //   fit: BoxFit.cover,
        // ),
        /*body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Hello'),
            Text('World'),
            Image.network(
              'https://t3.ftcdn.net/jpg/06/12/00/18/360_F_612001823_TkzT0xmIgagoDCyQ0yuJYEGu8j6VNVYT.jpg',
              width: 350,
              height: 300,
              fit: BoxFit.cover,
            ),
            Text('This is a shoe image'),
            Text('sjfdkk'),
          ],
        ),*/
        /*body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Hello'),
            Text('Another'),
            Text('World'),
            Image.network(
              'https://t3.ftcdn.net/jpg/06/12/00/18/360_F_612001823_TkzT0xmIgagoDCyQ0yuJYEGu8j6VNVYT.jpg',
              width: 100,
              fit: BoxFit.cover,
            ),
            Text('Shoe')
          ],
        ),*/
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello world'),
            Row(
              children: [
                Text('Hello'),
                Text('World'),
                Image.network(
                  'https://t3.ftcdn.net/jpg/06/12/00/18/360_F_612001823_TkzT0xmIgagoDCyQ0yuJYEGu8j6VNVYT.jpg',
                  width: 100,
                  fit: BoxFit.cover,
                ),
                Text('This is a shoe image'),
                Text('sjfdkk'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                  'https://t3.ftcdn.net/jpg/06/12/00/18/360_F_612001823_TkzT0xmIgagoDCyQ0yuJYEGu8j6VNVYT.jpg',
                  width: 100,
                  fit: BoxFit.cover,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('This'),
                    Text('is'),
                    Text('Nike new version'),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
