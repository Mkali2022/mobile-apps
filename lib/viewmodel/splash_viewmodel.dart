import 'dart:async';

import 'package:driver_app/view/screens/splash_screen.dart';
import 'package:get/get.dart';

import '../view/screens/auth/login_screen.dart';

class SplashViewModel extends GetxController {


  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () => Get.to(() => LoginScreen()));
    super.onInit();
  }
}