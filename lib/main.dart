import 'package:driver_app/view/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:get/get.dart';

import 'helper/app_life_cycle.dart';
String? deviceToken; //

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  Get.put(LifeCycleController());
  FlutterAppBadger.isAppBadgeSupported().then((value) {
    FlutterAppBadger.removeBadge();
  });

  FirebaseDatabase().setPersistenceEnabled(true);
  await messaging.getToken().then((value) {
    deviceToken = value;
    print('DeviceToken: $deviceToken');
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MAT Drivers',
      theme: ThemeData(fontFamily: 'alqabas'),
      home: const SplashScreen(),
    );
  }
}

