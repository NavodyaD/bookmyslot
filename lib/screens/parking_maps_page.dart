import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ParkingMapPage extends StatefulWidget {
  @override
  _ParkingMapPageState createState() => _ParkingMapPageState();
}

class _ParkingMapPageState extends State<ParkingMapPage> {
  final List<Marker> _markers = [];

  final LatLng _parkingLocation_1 = LatLng(6.037, 80.220); // Galle parking coordinates
  final LatLng _parkingLocation_2 = LatLng(6.9271, 79.8612); // Colombo parking coordinates

  @override
  void initState() {
    super.initState();
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

// sample parking page - galle
class GalleParkingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galle Parking'),
      ),
      body: Center(
        child: Text('This is Galle Parking Page'),
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
