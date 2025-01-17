import 'dart:async';
import 'package:geolocator/geolocator.dart';

class LocationService {
  StreamSubscription<Position>? _positionStream;

  // Stream for location updates
  Stream<Position> getPositionStream() {
    // Create a LocationSettings object with desired accuracy and distance filter
    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,  // Set desired accuracy
      distanceFilter: 10,               // Set distance filter in meters
    );

    return Geolocator.getPositionStream(locationSettings: locationSettings);
  }

  // Function to start tracking location
  void startLocationStream(Function(Position position) onLocationChanged) {
    _positionStream = getPositionStream().listen((Position position) {
      onLocationChanged(position); // Callback to update UI
    });
  }

  // Function to stop location tracking
  void stopLocationStream() {
    _positionStream?.cancel();
  }
}
