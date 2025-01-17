import 'package:e_commere_api/Controller/locationServer.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
//import 'location_service.dart'; // Import the LocationService

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String _locationMessage = "Getting location...";
  late LocationService _locationService;

  @override
  void initState() {
    super.initState();
    _locationService = LocationService();
    _startLocationTracking();
  }

  // Start location tracking by calling the LocationService
  void _startLocationTracking() {
    _locationService.startLocationStream((Position position) {
      setState(() {
        _locationMessage =
        "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
      });
    });
  }

  @override
  void dispose() {
    _locationService.stopLocationStream(); // Stop location tracking when no longer needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Location'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(_locationMessage),
      ),
    );
  }
}
