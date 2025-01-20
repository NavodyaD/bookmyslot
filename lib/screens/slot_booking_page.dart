import 'package:bookmyslot/widgets/primary_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SlotBookingPage extends StatefulWidget {
  final int parkingSlotId;

  SlotBookingPage({required this.parkingSlotId});

  @override
  State<SlotBookingPage> createState() => _SlotBookingPageState();
}

class _SlotBookingPageState extends State<SlotBookingPage> {
  final double price = 5.00;
  late int slotId;

  @override
  void initState() {
    super.initState();
    slotId = widget.parkingSlotId;
  }

  final TextEditingController vehicleNumberController = TextEditingController();
  final TextEditingController driverNameController = TextEditingController();

  void _bookSlot() async {
    final vehicleNumber = vehicleNumberController.text;
    final driverName = driverNameController.text;
    final currentTime = DateTime.now();

    if (vehicleNumber.isEmpty || driverName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields!')),
      );
      return;
    }

    try {
      // create unique id
      String bookingId = FirebaseFirestore.instance.collection('Bookings').doc().id;

      // map data to store
      Map<String, dynamic> bookingData = {
        'bookingId': bookingId,
        'parkingSlotId': slotId,
        'price': price,
        'vehicleNumber': vehicleNumber,
        'driverName': driverName,
        'dateTime': currentTime,
      };

      await FirebaseFirestore.instance.collection('Bookings').doc(bookingId).set(bookingData);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Booking Confirmed!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to book. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Selected Slot', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(45),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Parking Slot ID: ${widget.parkingSlotId}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Price: \$${price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 40),

              Text(
                'Your Vehicle Number',
                style: TextStyle(fontSize: 24),
              ),

              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your vehicle number',
                ),
                controller: vehicleNumberController,
              ),

              Text(
                'Driver Name',
                style: TextStyle(fontSize: 24),
              ),

              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the driver name',
                ),
                controller: driverNameController,
              ),

              SizedBox(height: 40),

              // payment dummy
              Text(
                'Payment Method:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Cardholder Name',
                  border: OutlineInputBorder(),
                  hintText: 'Enter cardholder name',
                ),
              ),
              SizedBox(height: 12),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Credit/Debit Card Number',
                  border: OutlineInputBorder(),
                  hintText: 'Enter card number',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Expiration Month',
                        border: OutlineInputBorder(),
                        hintText: 'YY/MM',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Expiration Year',
                        border: OutlineInputBorder(),
                        hintText: 'YYYY',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              Center(
                child: PrimaryAppButton(
                  buttonText: 'Book Now',
                  onPressed: _bookSlot,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
