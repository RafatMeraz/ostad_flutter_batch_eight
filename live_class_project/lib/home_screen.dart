import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

// 1. App needs permission to use GPS
// 2. GPS service status on
// 3. Fetch GPS current location/listen current location

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _listenCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    if (await _checkPermissionStatus()) {
      if (await _isGpsServiceEnable()) {
        // ONE TIME LOCATION
        _currentPosition = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.best,
          )
        );
        setState(() {});
      } else {
        _requestGpsService();
      }
    } else {
      _requestPermission();
    }
  }

  Future<void> _listenCurrentLocation() async {
    if (await _checkPermissionStatus()) {
      if (await _isGpsServiceEnable()) {
        // STREAM OF LOCATION
        Geolocator.getPositionStream(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.best,
            distanceFilter: 2,
            // timeLimit: Duration(seconds: 1),
          )
        ).listen((pos) {
          print(pos);
        });
      } else {
        _requestGpsService();
      }
    } else {
      _requestPermission();
    }
  }

  Future<bool> _checkPermissionStatus() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      return true;
    }
    return false;
  }

  Future<bool> _requestPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      return true;
    }
    return false;
  }

  Future<bool> _isGpsServiceEnable() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  Future<void> _requestGpsService() async {
    await Geolocator.openLocationSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My location'),
      ),
      body: Center(
        child: Column(
          children: [
            // Text('Permission status: '),
            // Text('GPS status: '),
            Text('Current location: $_currentPosition'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _getCurrentLocation,
        child: const Icon(Icons.add_location_outlined),
      ),
    );
  }

}
