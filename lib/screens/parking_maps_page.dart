import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ParkingMapPage extends StatefulWidget {
  @override
  _ParkingMapPageState createState() => _ParkingMapPageState();
}

class _ParkingMapPageState extends State<ParkingMapPage> {
  late GoogleMapController _mapController;
  Set<Marker> _markers = {};

  // parking location 1
  final LatLng _galleLocation = LatLng(6.037, 80.220); // galle coordinates
  // parking location 2
  final LatLng _colomboLocation = LatLng(6.9271, 79.8612); // colombo coordinates

  @override
  void initState() {
    super.initState();
    _addStaticMarkers(); // add static parking markers
  }

  // Function to add static markers for 2 parking locations (galle , colombo)
  void _addStaticMarkers() {
    _markers.add(
      Marker(
        markerId: MarkerId('galle'),
        position: _galleLocation,
        infoWindow: InfoWindow(
          title: 'Galle Parking',
          snippet: 'Tap to view Galle Parking',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GalleParkingPage()),
            );
          },
        ),
      ),
    );

    _markers.add(
      Marker(
        markerId: MarkerId('colombo'),
        position: _colomboLocation,
        infoWindow: InfoWindow(
          title: 'Colombo Parking',
          snippet: 'Tap to view Colombo Parking',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ColomboParkingPage()),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parking Locations'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          _mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: _galleLocation, // default camera position - initial position
          zoom: 8,
        ),
        markers: _markers,
        mapType: MapType.normal,
      ),
    );
  }
}

// Galle parking page
class GalleParkingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galle Parking'),
      ),
      body: Center(
        child: Text('Welcome to Galle Parking'),
      ),
    );
  }
}

// Colombo parking page
class ColomboParkingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Colombo Parking'),
      ),
      body: Center(
        child: Text('Welcome to Colombo Parking'),
      ),
    );
  }
}
