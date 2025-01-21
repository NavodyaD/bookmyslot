import 'package:bookmyslot/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BookingSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("Success")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Slot Booking Successful!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 50),

            // Lottie animation
            Lottie.asset('assets/animations/animation_success.json', width: 200, height: 200),

            SizedBox(height: 50),
            Container(
              width: 200,
              child: PrimaryAppButton(buttonText: 'Done', onPressed: () {
                Navigator.pop(context); // go back to the previous screen
              }),
            ),
          ],
        ),
      ),
    );
  }
}
