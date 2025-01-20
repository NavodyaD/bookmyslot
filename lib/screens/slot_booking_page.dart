import 'package:bookmyslot/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SlotBookingPage extends StatelessWidget {
  final int parkingSlotId;
  final double price = 5.00;

  SlotBookingPage({required this.parkingSlotId});

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
                'Parking Slot ID: $parkingSlotId',
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
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Booking Confirmed!')),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
