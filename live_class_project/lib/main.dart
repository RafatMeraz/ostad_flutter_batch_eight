import 'package:flutter/material.dart';

// Divider, ModalBottomSheet, TextField

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
              onPressed: () {
                // showAboutDialog(context: context);
                showModalBottomSheet(
                  // barrierColor: Colors.grey.shade50,
                  // backgroundColor: Colors.green.shade200,
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  isScrollControlled: true,
                  useSafeArea: true,
                  enableDrag: false,
                  builder: (ctx) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Title',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 20,
                          thickness: 4,
                        ),
                        Text('Sample'),
                        Row(
                          children: [
                            ElevatedButton(
                                onPressed: () {}, child: Text('Cancel')),
                            ElevatedButton(
                                onPressed: () {}, child: Text('Save')),
                          ],
                        )
                      ],
                    );
                  },
                );
              },
              child: Text('Show dialog'),
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                maxLength: 50,
                onChanged: (String? value) {
                  print(value);
                },
                controller: TextEditingController(),
                // obscureText: true,
                maxLines: 1,
                keyboardType: TextInputType.phone,
                enabled: true,
                decoration: InputDecoration(
                  hintText: 'Phone',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade400,
                  ),
                  labelText: 'Phone number',
                  // label: Icon(Icons.add),
                  prefixIcon: Icon(Icons.phone),
                  suffixIcon: Icon(Icons.person),
                  fillColor: Colors.white54,
                  filled: true,
                  // counterStyle: TextStyle(
                  //   fontSize: 24
                  // ),
                  // counterText: '',
                  // prefix: Column(
                  //   children: [
                  //     Text('d'),
                  //     Text('b'),
                  //   ],
                  // ),
                  // suffix: Column(
                  //   children: [
                  //     Text('d'),
                  //     Text('b'),
                  //   ],
                  // ),
                  // icon: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 4),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Suggestion => ctl + space
