import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class APIRequest {
  Future<dynamic> getMethodRequest(
    String? url,
    Map<String, String>? header,
  ) async {
    var request = http.Request('GET', Uri.parse('$url'));
    request.headers.addAll(header!);
    http.StreamedResponse res = await request.send();
    String response = await res.stream.bytesToString();
    log('$url', name: 'URL: ');
    log('$response', name: 'RESPONSE: ');
    if (res.statusCode == 401) {
      // final prefs = await SharedPreferences.getInstance();
      // prefs.remove('userToken');
      // prefs.remove('user');
      // Get.deleteAll();
      // Get.offAll(LogInPhone());
    } else {
      if (json.decode(response)['data'] != null) {
        // ApiResponse apiResponse = apiResponseFromJson(response);
        // if (apiResponse.error!) {
        //   // Request has error -> true
        //   Get.snackbar('Failed', '${apiResponse.message}');
        //   return apiResponse.message;
        // } else {
        //   // Request success -> data {json} && error-> false
        //   return apiResponse.data!;
        // }
      } else {
        // Data null
        return null;
      }
    }
  }

  Future<dynamic> deleteMethodRequest(
    String? url,
    Map<String, String>? header,
  ) async {
    var request = http.Request('DELETE', Uri.parse('$url'));
    request.headers.addAll(header!);
    http.StreamedResponse res = await request.send();
    String response = await res.stream.bytesToString();
    log('$url', name: 'URL: ');
    log('$response', name: 'RESPONSE: ');
    if (res.statusCode == 401) {
      // User not Authorized

      // final prefs = await SharedPreferences.getInstance();
      // prefs.remove('userToken');
      // prefs.remove('user');
      // Get.deleteAll();
      // Get.offAll(LogInPhone());
    } else {
      if (json.decode(response)['error']) {
        // Request has error -> true
        Get.snackbar('Failed', '${json.decode(response)['message']}');
        return 'null';
      } else {
        return {};
      }
    }
  }

  Future<dynamic> multiPartMethodRequest(
    String? url,
    Map<String, String> header,
    Map<String, String>? body,
    Map<String, File>? files,
  ) async {
    var request = http.MultipartRequest('POST', Uri.parse('$url'));
    request.fields.addAll(body!);
    if (files != null && files.isNotEmpty) {
      files.forEach((key, value) async {
        request.files
            .add(await http.MultipartFile.fromPath('$key', '${value.path}'));
      });
    }
    request.headers.addAll(header);
    http.StreamedResponse res = await request.send();
    String response = await res.stream.bytesToString();
    log('$url', name: 'URL: ');
    log('${res.statusCode}', name: 'StatusCode: ');
    log('${jsonEncode(body)}', name: 'body: ');
    log('${header}', name: 'StatusCode: ');
    log('$response', name: 'header: ');
    if (res.statusCode == 401) {
      // User not Authorized

      // final prefs = await SharedPreferences.getInstance();
      // prefs.remove('userToken');
      // prefs.remove('user');
      // Get.deleteAll();
      // Get.offAll(LogInPhone());
    } else {
      // ApiResponse apiResponse = apiResponseFromJson(response);
      // if (apiResponse.error!) {
      //   // Request has error -> true
      //   if (json.decode(response)['message'] != null) {
      //     return json.decode(response)['message'];
      //   } else if (json.decode(response)['message'].toString() != '[]' &&
      //       json.decode(response)['message']['phone'] != null) {
      //     return json.decode(response)['message'];
      //   } else if (json.decode(response)['message'] == 'NotFound') {
      //     log('${json.decode(response)['message']}', name: 'body: ');
      //     return 'NotFound';
      //   } else if (apiResponse.message.toString() != '[]')
      //     return apiResponse.message;
      // } else if (!apiResponse.error! && apiResponse.data == null) {
      //   return ApiResponse();
      // } else {
      //   // Request success -> data {json} && error-> false
      //   return apiResponse.data!;
      // }
    }
  }

  // Future<Map<String, dynamic>> postMethodRequest(String? url,
  //     Map<String, String>? header, Map<String, String>? body) async {
  //   var request = http.Request('POST', Uri.parse('$url'));
  //   request.body = json.encode(body);
  //   request.headers.addAll(header!);
  //   http.StreamedResponse res = await request.send();
  //   String response = await res.stream.bytesToString();
  //   log('$url', name: 'URL: ');
  //   log('$response', name: 'RESPONSE: ');
  //   if (res.statusCode == 401) {
  //     // User not Authorized
  //
  //     // final prefs = await SharedPreferences.getInstance();
  //     // prefs.remove('userToken');
  //     // prefs.remove('user');
  //     // Get.deleteAll();
  //     // Get.offAll(LogInPhone());
  //     return {};
  //   }
  //   else {
  //     ApiResponse apiResponse = apiResponseFromJson(response);
  //     if (apiResponse.error!) {
  //       // Request has error -> true
  //       Get.snackbar('Failed', '${apiResponse.message}');
  //       return apiResponse.message;
  //     } else {
  //       // Request success -> data {json} && error-> false
  //       return apiResponse.data!;
  //     }
  //   }
  // }
}
