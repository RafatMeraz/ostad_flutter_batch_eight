// Synchronous
// Asynchronous

// Future, async, await
import 'dart:async';

Future<void> main() async {
  print('Hello');
  await Future.delayed(Duration(seconds: 3));
  print('World');
}