import 'package:flutter/material.dart';

class ParkingSlotTile extends StatelessWidget {
  final int slotNumber;
  final String slotStatus;

  ParkingSlotTile({required this.slotNumber, required this.slotStatus});

  @override
  Widget build(BuildContext context) {
    // define color and image visibility based on slotStatus
    Color stripColor;
    bool showImage;

    if (slotStatus == 'booked') {
      stripColor = Colors.orange;
      showImage = false;
    } else if (slotStatus == 'vehicleParked') {
      stripColor = Colors.white;
      showImage = true;
    } else { // 'available'
      stripColor = Colors.green;
      showImage = false;
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Column(
        children: [
          Row(
            children: [
              if (showImage) // control the img visibility
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'lib/assets/images/car_bird_view.png',
                    height: 45,
                    width: 75,
                  ),
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Slot $slotNumber',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54),
                    ),
                    Text(
                      slotStatus == 'available'
                          ? 'Available'
                          : slotStatus == 'vehicleParked'
                          ? 'Parked'
                          : 'Booked',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black45),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity, // full width
            height: 8,
            color: stripColor,
          ),
        ],
      ),
    );
  }
}
