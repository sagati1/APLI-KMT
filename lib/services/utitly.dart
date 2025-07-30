import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserLocation {
  static Position? position;
  static BitmapDescriptor? customMarkerIcon;
  static BitmapDescriptor? yelloPin;
  static Future<Position> getUserLocation() async {
    await initializeMarkers();
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position!;
  }

  static initializeMarkers() async {
    yelloPin = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(8, 8)),
      'assets/images/bus.png', // Your custom marker asset
    );
    customMarkerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(8, 8)),
      'assets/images/bus-stop.png', // Your custom marker asset
    );
  }
}
