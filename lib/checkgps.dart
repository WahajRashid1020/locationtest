import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:velocity_x/velocity_x.dart';

class CheckGps extends StatefulWidget {
  @override
  _CheckGpsState createState() => _CheckGpsState();
}

class _CheckGpsState extends State<CheckGps> {
  var isGpsEnabled = Geolocator.isLocationServiceEnabled();

  bool chk = true;

  _checkGps(context) async {
    if (!(await Geolocator.isLocationServiceEnabled())) {
      chk = true;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Can't get current location"),
            content: const Text(
                'Please make sure you enable Location and try again'),
            actions: <Widget>[
              ElevatedButton(
                child: Text('Ok'),
                onPressed: () {
                  final AndroidIntent intent = AndroidIntent(
                      action: 'android.settings.LOCATION_SOURCE_SETTINGS');

                  intent.launch();
                  Navigator.of(context, rootNavigator: true).pop();
                },
              ),
            ],
          );
        },
      );
    } else if ((await Geolocator.isLocationServiceEnabled())) {
      chk = false;
    }
    setState(() {
      if (chk == true) {
        print("yes");
      } else if (chk == false) {
        print("never");
      }
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();

    _checkGps(context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.all(10.0)),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: ElevatedButton(
                    onPressed: () {
                      _checkGps(context);
                    },
                    child: Text("Next"))
                .centered(),
          )
        ],
      ),
    );
  }
}
