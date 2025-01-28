import 'package:firebase_database/firebase_database.dart';

class SlotService {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref().child('slots');

  // Method to fetch the status of a slot from real-time db
  // function - get slot status
  Stream<String> getSlotStatus(int slotNumber) {
    return _dbRef.child(slotNumber.toString()).onValue.map((event) {
      if (event.snapshot.value != null) {
        return event.snapshot.value as String;
      }
      return "available"; // set default as 'available'
    });
  }

  // Method to update slot status
  // function - update slot status
  Future<void> updateSlotStatus(int slotNumber, String status) async {
    await _dbRef.child(slotNumber.toString()).set(status);
  }
}
