import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final GoogleMapController _mapController;

  final Set<Marker> _markers = <Marker>{
    Marker(
      markerId: const MarkerId('my-home'),
      position: const LatLng(23.774849416278222, 90.41596094616027),
      infoWindow: InfoWindow(title: 'My home', onTap: () {}),
      onTap: () {
        // do whatever you want
      },
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueMagenta,
      ),
    ),
    Marker(
      markerId: const MarkerId('my-office'),
      position: const LatLng(23.777370555591688, 90.4159214347601),
      infoWindow: InfoWindow(title: 'My Office', onTap: () {}),
      onTap: () {
        // do whatever you want
      },
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRose,
      ),
    ),
    Marker(
      markerId: const MarkerId('pick-up-location'),
      position: const LatLng(23.780598236131627, 90.41595228016376),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
      draggable: true,
      onDragStart: (LatLng startLatLng) {
        print('Start latLng $startLatLng');
      },
      onDragEnd: (LatLng startLatLng) {
        print('Stop latLng $startLatLng');
      },
    ),
  };

  final Set<Polyline> _polylines = <Polyline>{
    const Polyline(
        polylineId: PolylineId('home-to-office'),
        points: [
          LatLng(23.774849416278222, 90.41596094616027),
          LatLng(23.777370555591688, 90.4159214347601),
          LatLng(23.778156312956323, 90.41329152882099),
          LatLng(23.772899533441905, 90.41604582220316),
        ],
        color: Colors.pink,
        endCap: Cap.roundCap,
        width: 4,
        jointType: JointType.round,
        startCap: Cap.roundCap),
  };

  final Set<Circle> _circles = <Circle>{
    Circle(
      circleId: const CircleId('most-affected'),
      center: const LatLng(23.778156312956323, 90.41329152882099),
      radius: 300,
      fillColor: Colors.red.withOpacity(0.3),
      strokeWidth: 3,
      strokeColor: Colors.red,
    )
  };

  final Set<Polygon> _polygons = <Polygon>{
    Polygon(
      polygonId: PolygonId('random-polygon'),
      points: [
        LatLng(23.766731528855367, 90.41600994765759),
        LatLng(23.761289867649076, 90.4157605022192),
        LatLng(23.764274923468317, 90.42268931865692),
        LatLng(23.768031000957524, 90.41978683322668),
        LatLng(23.7682595962423, 90.41704025119543)
      ],
      fillColor: Colors.orange.withOpacity(0.4),
      strokeColor: Colors.orange,
      strokeWidth: 4,
      onTap: () {
        print('Tapped on polygon');
      }
    )
  };

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
        zoomGesturesEnabled: true,
        compassEnabled: true,
        markers: _markers,
        polylines: _polylines,
        circles: _circles,
        polygons: _polygons,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: _addNewMarker,
            child: const Icon(Icons.location_on_outlined),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: _goBackToMyLocation,
            child: const Icon(Icons.my_location),
          ),
        ],
      ),
    );
  }

  void _addNewMarker() {
    _markers.add(
      const Marker(
        markerId: MarkerId('new-marker'),
        position: LatLng(23.77316463264566, 90.41587483137846),
      ),
    );
    setState(() {});
  }

  void _goBackToMyLocation() {
    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(
          zoom: 16,
          target: LatLng(23.774849416278222, 90.41596094616027),
        ),
      ),
    );
  }
}
