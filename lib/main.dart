import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:locationtest/askpermission.dart';
import 'package:locationtest/checkgps.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:location/location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CheckGps(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          "Location-Testing".text.xl4.make().centered(),
        ],
      ),
    );
  }

  // fetchCurrentLocation() async {
  //   print("STARTING LOCATION SERVICE");
  //   var location = Location();
  //   location.changeSettings(
  //       accuracy: LocationAccuracy.POWERSAVE,
  //       interval: 1000,
  //       distanceFilter: 500);
  //   if (!await location.hasPermission()) {
  //     await location.requestPermission();
  //   }

  //   try {
  //     await location.onLocationChanged().listen((LocationData currentLocation) {
  //       print(currentLocation.latitude);
  //       print(currentLocation.longitude);
  //       latitude = currentLocation.latitude;
  //       longitude = currentLocation.longitude;
  //     });
  //   } on PlatformException {
  //     location = null;
  //   }
  // }
}
