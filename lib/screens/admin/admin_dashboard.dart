import 'package:bookmyslot/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminDashboardPage extends StatefulWidget {
  @override
  _BookingHistoryPageState createState() => _BookingHistoryPageState();
}

class _BookingHistoryPageState extends State<AdminDashboardPage> {
  final List<int> slotIds = [201, 202, 427, 428];
  int? selectedSlotId; // Selected slot ID
  List<Map<String, dynamic>> bookings = [];

  // fetch booking history for the selected slot
  void fetchBookings() async {
    if (selectedSlotId == null) return;

    FirebaseFirestore.instance
        .collection('Bookings')
        .where('parkingSlotId', isEqualTo: selectedSlotId)
        .get()
        .then((querySnapshot) {
      List<Map<String, dynamic>> fetchedBookings = [];
      for (var doc in querySnapshot.docs) {
        fetchedBookings.add(doc.data());
      }
      setState(() {
        bookings = fetchedBookings;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BookMySlot Admin Dashboard', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('View Bookings History', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            Text('Booking history of parking slots', style: TextStyle(fontSize: 15, color: Colors.grey),),
            SizedBox(height: 25,),
            Text('Select Slot ID', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
            // slots dropdown
            DropdownButton<int>(
              value: selectedSlotId,
              hint: Text('Select Parking Slot'),
              isExpanded: true,
              items: slotIds.map((int slot) {
                return DropdownMenuItem<int>(
                  value: slot,
                  child: Text('Slot $slot'),
                );
              }).toList(),
              onChanged: (int? newValue) {
                setState(() {
                  selectedSlotId = newValue;
                });
              },
            ),
            SizedBox(height: 10),
            PrimaryAppButton(buttonText: 'Display Booking History', onPressed: fetchBookings),
            SizedBox(height: 20),
            // list display here
            Expanded(
              child: bookings.isEmpty
                  ? Center(child: Text('No bookings found for this slot'))
                  : ListView.builder(
                itemCount: bookings.length,
                itemBuilder: (context, index) {
                  var booking = bookings[index];
                  return Card(
                    child: ListTile(
                      title: Text('Vehicle: ${booking['vehicleNumber']}'),
                      subtitle: Text(
                          'Driver: ${booking['driverName']}\nDate: ${booking['dateTime']}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
