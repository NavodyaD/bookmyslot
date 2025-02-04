import 'package:bookmyslot/screens/parking_location_2/parking_page_location2.dart';
import 'package:bookmyslot/screens/parking_page.dart';
import 'package:bookmyslot/widgets/parking_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ParkingMapPage extends StatefulWidget {
  @override
  _ParkingMapPageState createState() => _ParkingMapPageState();
}

class _ParkingMapPageState extends State<ParkingMapPage> {
  //late final List<Marker> _markers = [];
  List<Marker> _markers = [];

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
        width: 200,
        height: 80,
        // gesture detector as marker child
        child: GestureDetector(
          onTap: () {
            _navigateToParkingLocationOne();
          },
          child: ParkingMarker(imagePath: 'assets/images/location_mark_img.png', parkingName: 'Galle Parking', vehicleCount: '2', price: 'USD 5.00'),
        ),
      ),
      Marker(
        point: _parkingLocation_2,
        width: 200,
        height: 80,
        // gesture detector as marker child
        child: GestureDetector(
          onTap: () {
            _navigateToParkingLocationTwo();
          },
          child: ParkingMarker(imagePath: 'assets/images/location_mark_img.png', parkingName: 'Colombo Parking', vehicleCount: '4', price: 'USD 8.00'),
        ),
      ),
    ]);
  }

  // Navigate to First Parking Page
  void _navigateToParkingLocationOne() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ParkingPageLoc1(),
      ),
    );
  }

  // Navigate to Second Parking Page
  void _navigateToParkingLocationTwo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ParkingPageLoc2(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
            FlutterMap(
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
          Positioned(
            top: 30,
            left: 25,
            right: 25,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu, color: Colors.black),
                    Text(
                      'Parkings Map',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.search, color: Colors.black),
                  ],
                ),
              ),
            ),
          ),
        ]
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
