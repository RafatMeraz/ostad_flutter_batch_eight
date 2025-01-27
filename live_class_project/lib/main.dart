import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RxInt count = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
          child: Column(
        children: [
          Obx(() {
            return Text(
              count.toString(),
              style: const TextStyle(fontSize: 32),
            );
          }),
          TextButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const SettingsScreen()),
              // );
              // Get.to(const SettingsScreen());
              Get.toNamed('/settings');
            },
            child: const Text('Go to Settings'),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count.value++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: Column(
          children: [
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
    );
  }
}
