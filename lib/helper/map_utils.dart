import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();

  static Future<void> openMap(
      LatLng originLatLng,destinationLat, destinationLong) async {
    String origin = "${originLatLng.latitude},${originLatLng.longitude}";
    String destination =
        "$destinationLat,$destinationLong";
    if (Platform.isAndroid) {
      final AndroidIntent intent = AndroidIntent(
          action: 'action_view',
          data: Uri.encodeFull(
              "https://www.google.com/maps/dir/?api=1&origin=$origin&destination=$destination&travelmode=driving&dir_action=navigate"),
          package: 'com.google.android.apps.maps');
      intent.launch();
    } else {
      String url = "comgooglemapsurl://maps.google.com/maps/dir/?api=1&origin=$origin&destination=$destination&views=transit&travelmode=driving&dir_action=navigate";
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}
