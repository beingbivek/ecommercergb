import 'package:ecommercergb/constants/constant.dart';
import 'package:ecommercergb/service/citynameservice.dart';
import 'package:location/location.dart';

Location location = Location();

bool _serviceEnabled = false;
PermissionStatus _permissionGranted = PermissionStatus.denied;

// Future<bool> isServiceEnabled() async {
//   _serviceEnabled = await location.serviceEnabled();
//   if (!_serviceEnabled) {
//     _serviceEnabled = await location.requestService();
//   }
//   return _serviceEnabled;
// }

// Future<PermissionStatus> getPermissionStatus() async {
//   _permissionGranted = await location.hasPermission();
//   if (_permissionGranted == PermissionStatus.denied) {
//     _permissionGranted = await location.requestPermission();
//     if (_permissionGranted != PermissionStatus.granted) {
//       return _permissionGranted;
//     }
//   }
//   return _permissionGranted;
// }

// Future<LocationData> getLocationData() async {
//   return await location.getLocation();
// }

Future<dynamic> getCityName() async {
  try {
    _permissionGranted = await location.hasPermission();
    while (_permissionGranted == PermissionStatus.granted) {
      await location.requestPermission();
    }
    _serviceEnabled = await location.serviceEnabled();
    while (_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }
    if (_permissionGranted == PermissionStatus.granted && _serviceEnabled) {
      var locator = await location.getLocation();
      NetworkHelper networkHelper = NetworkHelper(
          '$openWeatherMapURL?lat=${locator.latitude}&lon=${locator.longitude}&appid=$apiKey&units=metric');
      dynamic cityDetails = await networkHelper.getData();
      return cityDetails['name'];
    } else {
      return "No Internet Connection";
    }
  } catch (e) {
    print("object");
    return 'Problem is ' + e.toString();
  }
}
