//import 'package:location/location.dart';
//import 'package:rxdart/subjects.dart';
//
//class LocationBloc {
//  LocationData currentLocation;
//  var location = Location();
//
//  final locationStream = BehaviorSubject<LocationData>()..add(null);
//
//  getCurrentLocation() async {
//    currentLocation = await location.getLocation();
//    locationStream.add(currentLocation);
//    print('currentLocation lat: ${currentLocation.latitude}');
//  }
////
////
////  Future<double> getCurrentLat() async {
////    currentLocation = await location.getLocation();
////
////    print('currentLocation lat: ${currentLocation.latitude}');
////    return currentLocation.latitude;
////  }
////
////  Future<double> getCurrentLon() async {
////    currentLocation = await location.getLocation();
////    print('currentLocation lon: ${currentLocation.longitude}');
////    return currentLocation.longitude;
////  }
//}