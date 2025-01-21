import 'package:bookmyslot/firebase_options.dart';
import 'package:bookmyslot/screens/parking_maps_page.dart';
import 'package:bookmyslot/screens/parking_page.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase only once
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,  // Use the generated options for platform-specific configuration
  );

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ParkingPage(),
    );
  }
}
