import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {


  String _locationMessage = "Getting location...";


// get location
  getCurrentLocation()async{
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied || permission== LocationPermission.deniedForever){
      log("Loaction Denied" as num);
      LocationPermission ask = await Geolocator.requestPermission();
    }else{
      Position currentposition= await Geolocator.getCurrentPosition(desiredAccuracy:LocationAccuracy.high);
      print("Latitude =${currentposition.latitude}");
      print("Longitude =${currentposition.longitude}");

      setState(() {
        _locationMessage =
        "Latitude: ${currentposition.latitude}, Longitude: ${currentposition.longitude}";
      });
    }
  }

  // current location track


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
        centerTitle: true,
      ),
      body: Column(
        children: [

          Text(_locationMessage),
          ElevatedButton(onPressed: (){
            getCurrentLocation();
          }, child: Text('location')),
        ],
      ),
    );
  }
}
