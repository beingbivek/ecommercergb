import 'package:location/location.dart';
import 'package:ecommercergb/models/model.dart';

class LocationService {
  late UserLocation _currentLocation
      // = UserLocation(
      //         longitude: 1, latitude: 1)
      ;

  Location location = Location();

  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
          longitude: userLocation.longitude, latitude: userLocation.latitude);
    } catch (e) {
      print("Could not get location: $e");
    }
    return _currentLocation;
  }
}
