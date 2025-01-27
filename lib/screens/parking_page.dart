import 'package:bookmyslot/screens/slot_booking_page.dart';
import 'package:bookmyslot/widgets/road_line.dart';
import 'package:flutter/material.dart';

import '../widgets/parking_slot_tile.dart';

class ParkingPage extends StatefulWidget {
  const ParkingPage({super.key});

  @override
  State<ParkingPage> createState() => _ParkingPageState();
}

class _ParkingPageState extends State<ParkingPage> {
  @override
  Widget build(BuildContext context) {

    final double tileWidth = (MediaQuery.of(context).size.width - 105) / 2;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 10,
          title: Text('You want to park bro?', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Galle Parking Space", style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold,
              ),),

              SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 8),
                  Text('Cross Street, Galle Town, Galle',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.directions_car,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 8),
                  Text('4 Parking Slots',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.location_on, // You can replace this with any icon you prefer
                    color: Colors.blue, // Set the color of the icon
                  ),
                  SizedBox(width: 8), // A little space between the icon and text
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'Parking Charge ',
                        style: TextStyle(fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'USD 5.00',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text.rich(
                TextSpan(
                  text: 'Allowed Vehicles: ',
                  style: TextStyle(fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Car, Van, SUV',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.only(top: 20, bottom: 20, left: 8, right: 8),
                decoration: BoxDecoration(
                  color: Color(0xFFAEC5C2),
                  border: Border.all(color: Color(0xFF7FB5B0), width: 2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SlotBookingPage(
                                  parkingSlotId: 201,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 100, // Set a fixed height for the tile
                            width: tileWidth,  // To ensure it's split evenly
                            child: ParkingSlotTile(
                              slotStatus: 'vehicleParked',
                              slotNumber: 201,
                            ),
                          ),
                        ),
                        SizedBox(width: 8,),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SlotBookingPage(
                                  parkingSlotId: 202,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 100, // Fixed height for the tile
                            width: tileWidth, // Same width calculation
                            child: ParkingSlotTile(
                              slotStatus: 'vehicleParked',
                              slotNumber: 202,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Second row for the next two tiles
                    SizedBox(height: 12,),
                    RoadLineWidget(),
                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SlotBookingPage(
                                  parkingSlotId: 203,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 100, // Fixed height for the tile
                            width: tileWidth, // Same width calculation
                            child: ParkingSlotTile(
                              slotStatus: 'vehicleParked',
                              slotNumber: 203,
                            ),
                          ),
                        ),
                        SizedBox(width: 8,),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SlotBookingPage(
                                  parkingSlotId: 204,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 100, // Fixed height for the tile
                            width: tileWidth, // Same width calculation
                            child: ParkingSlotTile(
                              slotStatus: 'vehicleParked',
                              slotNumber: 204,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )




            ],
          ),
        ),
      ),
    );
  }
}
