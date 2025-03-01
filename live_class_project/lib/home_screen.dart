import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
      ),
      body: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: const CameraPosition(
          zoom: 16,
          target: LatLng(23.774849416278222, 90.41596094616027),
        ),
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        onTap: (LatLng latLng) {
          print('Tapped on $latLng');
        },
        trafficEnabled: true,
        onLongPress: (LatLng latLng) {
          print('Long pressed at $latLng');
        },
        zoomControlsEnabled: true,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
      ),
    );
  }
}
