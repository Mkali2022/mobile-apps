import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class ReceivedOrderViewModel extends GetxController{
  LatLng currentLocation = const LatLng(31.995236, 35.911773);
  GoogleMapController? controller;
  Set<Marker> markers = {};
  List<Marker> markersList = [];
  Location location =  Location();
  bool serviceEnabled = false;
  PermissionStatus? permissionGranted;
  LocationData? locationData;
  Completer<GoogleMapController> mapController = Completer();
  MarkerId currentMarkerId = const MarkerId('currentMarker');


  @override
  void onInit() {
    try {
      requestPermission();
      location.onLocationChanged.listen((event) {
        // log('$currentLocation', name: 'currentLocation');
        currentLocation = LatLng(event.latitude!, event.longitude!);
        update();
        // print(currentLocation);
      });
    } on Exception catch (e) {
      // TODO
    }
    super.onInit();
  }

  requestPermission() async {
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    locationData = await location.getLocation();
  }

  void onMapCreated(GoogleMapController googleMapController) async {
    // final Uint8List markerIcon = await getBytesFromAsset('assets/pin.png', 100);
    markersList.add(Marker(
        markerId: MarkerId(DateTime.now().toIso8601String()),
        position: currentLocation,
        draggable: true,
        onDrag: (value) {
          print('djhdc');
        },
        icon: BitmapDescriptor.defaultMarker
    ));
    if(!mapController.isCompleted){
      mapController.complete(googleMapController);
    }

    location.getLocation().then((event) async {
      final GoogleMapController controller = await mapController.future;
      try {
        controller
            .animateCamera(CameraUpdate.newLatLngBounds(boundsFromLatLngList(markers.toList()),100))
            .then((value) {
          markers.removeWhere((element) => element.markerId == currentMarkerId);
          markers.add(Marker(
              markerId: currentMarkerId,
              icon: BitmapDescriptor.defaultMarker,
              position:
              LatLng(currentLocation.latitude, currentLocation.longitude)));
          update();
        });
      } on Exception catch (e) {
        print("ERRORR:$e");
      }
    });
    location.onLocationChanged.listen((event) async {
      final GoogleMapController controller = await mapController.future;
      try {
        controller
            .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target:
            LatLng(currentLocation.latitude, currentLocation.longitude),
            zoom: 14)))
            .then((value) {
          markers.removeWhere((element) => element.markerId == currentMarkerId);
          markers.add(Marker(
              markerId: currentMarkerId,
              icon: BitmapDescriptor.defaultMarker,
              position:
              LatLng(currentLocation.latitude, currentLocation.longitude)));

          update();
        });
      } on Exception catch (e) {
        print("ERRORR:$e");
      }
    });
  }
  LatLngBounds boundsFromLatLngList(List<Marker> marker) {

    if (marker.isNotEmpty) {
      List<LatLng> list = [];
      for (int i = 0; i < marker.length; i++) {
        double lat = marker[i].position.latitude;
        double lng = marker[i].position.longitude;
        list.add( LatLng(lat, lng));
      }
      double? x0, x1, y0, y1;
      for (LatLng latLng in list) {
        if (x0 == null) {
          x0 = x1 = latLng.latitude;
          y0 = y1 = latLng.longitude;
        } else {
          if (latLng.latitude > x1!) x1 = latLng.latitude;
          if (latLng.latitude < x0) x0 = latLng.latitude;
          if (latLng.longitude > y1!) y1 = latLng.longitude;
          if (latLng.longitude < y0!) y0 = latLng.longitude;
        }
      }
      return LatLngBounds(
          northeast: LatLng(x1!, y1!), southwest: LatLng(x0!, y0!));
    }else {
      return LatLngBounds(northeast: currentLocation,southwest: currentLocation);
    }
  }
}