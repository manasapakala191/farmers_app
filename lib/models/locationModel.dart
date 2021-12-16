import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider extends ChangeNotifier{
  double latitude;
  double longitude;
  String? area;

  LocationProvider({required this.latitude, required this.longitude,required this.area});

  updateLocation(Position position) async {
    latitude = position.latitude;
    longitude = position.longitude;
    // From coordinates
    List<Placemark> placemarks = await placemarkFromCoordinates(52.2165157, 6.9437819);
    area = placemarks.first.locality.toString() + ", " + placemarks.first.name.toString();
    print(area);
    notifyListeners();
  }
}
