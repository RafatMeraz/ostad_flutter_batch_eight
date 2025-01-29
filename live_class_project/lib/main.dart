import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_class_project/controller_binder.dart';
import 'package:live_class_project/counter_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        late Widget routeWidget;

        if (settings.name == '/') {
          routeWidget = const HomeScreen();
        } else if (settings.name == '/profile') {
          routeWidget = const ProfileScreen();
        } else if (settings.name == '/settings') {
          routeWidget = const SettingsScreen();
        }

        return MaterialPageRoute(builder: (context) {
          return routeWidget;
        });
      },
      initialBinding: ControllerBinder(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
          child: Column(
        children: [
          GetBuilder<CounterController>(
            builder: (controller) {
              return Text(
                controller.count.toString(),
                style: const TextStyle(fontSize: 32),
              );
            },
          ),
          TextButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const SettingsScreen()),
              // );
              // Get.to(const SettingsScreen());
              Get.toNamed('/profile');
            },
            child: const Text('Go to Profile'),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<CounterController>().increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // TODO: solve this issue
  CounterController counterControllerTwo = CounterController();

  @override
  Widget build(BuildContext context) {
    print(counterControllerTwo.hashCode);
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: Column(
          children: [
            GetBuilder(
              init: counterControllerTwo,
              builder: (controller) {
                return Text(
                  controller.count.toString(),
                  style: const TextStyle(fontSize: 32),
                );
              },
            ),
            TextButton(
              onPressed: () {
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const ProfileScreen(),
                //   ),
                // );
                // Get.off(const ProfileScreen());
                Get.offNamed('/profile');
              },
              child: const Text('Go to Profile'),
            ),
            TextButton(
              onPressed: () {
                // Navigator.pop(context);
                Get.back();
              },
              child: const Text('Back'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterControllerTwo.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Column(
          children: [
            GetBuilder<CounterController>(
              builder: (controller) {
                return Text(
                  controller.count.toString(),
                  style: const TextStyle(fontSize: 32),
                );
              },
            ),
            TextButton(
              onPressed: () {
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(builder: (context) => const HomeScreen()),
                //   (predicate) => false,
                // );
                // Get.offAll(const HomeScreen());
                Get.offAllNamed('/');
              },
              child: const Text('Go to Home'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<CounterController>().increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
