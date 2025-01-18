import 'package:flutter/material.dart';

class ParkingSlotTile extends StatelessWidget {
  final int slotNumber;

  ParkingSlotTile({required this.slotNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              'Slot $slotNumber',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              'Available',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
