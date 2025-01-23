import 'package:bookmyslot/screens/parking_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ParkingMapPage extends StatefulWidget {
  @override
  _ParkingMapPageState createState() => _ParkingMapPageState();
}

class _ParkingMapPageState extends State<ParkingMapPage> {
  final List<Marker> _markers = [];

  final LatLng _parkingLocation_1 = LatLng(6.037, 80.220); //  coordinates
  final LatLng _parkingLocation_2 = LatLng(6.9271, 79.8612);

  @override
  void initState() {
    super.initState();
    _addStaticMarkers();
  }

  // Add pop up markers for parking locations
  void _addStaticMarkers() {
    _markers.addAll([
      Marker(
        point: _parkingLocation_1,
        width: 80,
        height: 80,
        // gesture detector as marker child
        child: GestureDetector(
          onTap: () {
            _navigateToParkingLocationOne();
          },
          child: Icon(Icons.local_parking, color: Colors.red, size: 40),
        ),
      ),
      Marker(
        point: _parkingLocation_2,
        width: 80,
        height: 80,
        // gesture detector as marker child
        child: GestureDetector(
          onTap: () {
            _navigateToParkingLocationTwo();
          },
          child: Icon(Icons.local_parking, color: Colors.blue, size: 40),
        ),
      ),
    ]);
  }

  // Navigate to First Parking Page
  void _navigateToParkingLocationOne() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ParkingPage(),
      ),
    );
  }

  // Navigate to Second Parking Page
  void _navigateToParkingLocationTwo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ColomboParkingPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parking Locations'),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(6.9271, 79.8612), // initial center location
          initialZoom: 10.0,
        ),
        children: [
          TileLayer(
            urlTemplate:
            'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', // Free OpenStreetMap tiles
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: _markers,
          ),
        ],
      ),
    );
  }
}

// sample parking page - colombo
class ColomboParkingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Colombo Parking'),
      ),
      body: Center(
        child: Text('This is Colombo Parking Page'),
      ),
    );
  }
}
