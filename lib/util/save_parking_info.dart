import 'package:firebase_database/firebase_database.dart';

/*void saveParkingInfo(int parkingSlotId, String vehicleNumber) {
  final databaseReference = FirebaseDatabase.instance.ref();


  // Get the current date and time
  String currentDateTime = DateTime.now().toString();

  // Write to the "parkings" node
  databaseReference.child("parkings").push().set({
    'parkingSlotId': "hii",
    'vehicleNumber': "hello",
    'bookingDateTime': "mk",
  }).then((_) {
    print("Data saved successfully");
  }).catchError((error) {
    print("Failed to save data: $error");
  });
}*/
