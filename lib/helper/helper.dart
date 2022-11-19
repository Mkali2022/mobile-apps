import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:driver_app/utils/app_colors.dart';
import 'package:geocoder2/geocoder2.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Helper {
    String googleMapApiKey = 'AIzaSyBl0oCDplk1264wmW7gxBMbDNxOy-Q_YSo';
  void loading() {
  Future.delayed(Duration.zero,(){
    if (Platform.isIOS) {
      Get.generalDialog(pageBuilder: (context, animation, secondaryAnimation) =>
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CupertinoActivityIndicator(),
            ],
          ),
          barrierColor: Colors.black38,

          barrierDismissible: false
      );
    } else {
      Get.generalDialog(pageBuilder: (context, animation, secondaryAnimation) =>
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
          barrierColor: Colors.black38,
          barrierDismissible: false);
    }
  });
  }

  requestBackgroundPermission(Function startApp,{bool isHome=false}) {
    Get.defaultDialog(
      title: 'العمل بالخلفية',
      content: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('السماح للتطبيق في العمل بالخلفية وتحديد الموقع حتى تتمكن من استقبال الطلبات'),

            ],
          ),
        ),
      ),
     textConfirm: 'قبول',
      textCancel: 'رفض',
      buttonColor: AppColors.babyBlue1,
      cancelTextColor: AppColors.babyBlue1,
      confirmTextColor: Colors.white,
      onCancel: () {
        SharedPreferences.getInstance().then((value) async{
          value.setBool('backgroundPermission', false);
          if (isHome){
            Get.back();
          }else {

            startApp();
          }
        });
      },
      onConfirm: () {
        SharedPreferences.getInstance().then((value) async{
          Get.back();
          value.setBool('backgroundPermission', true);
          startApp();
        });
      },
      barrierDismissible: false,
    );
  }

  void showHint(String title, message) {
    HapticFeedback.mediumImpact();
    Get.snackbar(title, '$message',
        icon: Icon(
          Icons.check_circle,
          color: Colors.green.shade800,
        ),
        backgroundColor: Colors.white,
        duration: const Duration(seconds: 3));
  }

  void showError(String title, message) {
    HapticFeedback.mediumImpact();
    Get.snackbar(title, '$message',
        icon: const Icon(
          Icons.cancel,
          color: Colors.red,
        ),
        backgroundColor: Colors.white,
        duration: const Duration(seconds: 3));
  }

  Future<String> getAddressDetails(double lat, double lng) async {
    try {
      FetchGeocoder fetchGeocoder = await Geocoder2.getAddressFromCoordinates(
          latitude: lat,
          longitude: lng,
          googleMapApiKey: googleMapApiKey);
      var first = fetchGeocoder.results.first;
      print(first.toJson());
      return first.formattedAddress;
    } catch (e) {
      return 'NAN';
    }
  }

  Future<dynamic> getDistanceMatrix(
      double lat, double lng, double dlat, double dlng) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://maps.googleapis.com/maps/api/distancematrix/json?destinations=$dlat,$dlng&origins=$lat,$lng&key=$googleMapApiKey&language=ar'));

    http.StreamedResponse response = await request.send();
    String res = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      print(res);
      return json.decode(res);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}

// Future<String> getUserToken1({bool isMain = false}) async {
//   final prefs = await SharedPreferences.getInstance();
//   String? token = prefs.getString('userToken');
//   if (token == null) {
//     if (!isMain)
//       Get.offAll(LogInPhone(),
//           transition: Transition.noTransition, curve: Curves.slowMiddle);
//     return '';
//   }
//   return token;
// }
