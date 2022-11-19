import 'dart:async';
import 'dart:isolate';


import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

void startCallback() {
  // The setTaskHandler function must be called to handle the task in the background.
  FlutterForegroundTask.setTaskHandler(BackgroundLocationHandler());
}

void startCallbackTrip() {
  // The setTaskHandler function must be called to handle the task in the background.
  FlutterForegroundTask.setTaskHandler(BackgroundLocationTripHandler());
}

class BackgroundLocationHandler extends TaskHandler {
  @override
  Future<void> onStart(DateTime timestamp, SendPort? sendPort) async {
    // You can use the getData function to get the data you saved.
    final customData =
        await FlutterForegroundTask.getData<String>(key: 'customData');
    print('customData: $customData');
  }

  @override
  Future<void> onEvent(DateTime timestamp, SendPort? sendPort) async {

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    final positionStream = Geolocator.getPositionStream();
    positionStream.listen((event) async {
      // UserStorage().readUser().then((String userInfo) async {
      //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      //   String type = sharedPreferences.getString("user_type")??"1";
      //   String id = sharedPreferences.getString("user_id")??"${userInfo.split(',').first}";
      //   // print("user_type$type--user_id$id");
      //   if (userInfo != '0,0')
      //     FirebaseDatabase.instanceFor(
      //             app: Firebase.app(),
      //             databaseURL:
      //                 'https://-default-rtdb.firebaseio.com/')
      //         .ref('driverOnline')
      //         .child('$id')
      //         .set({
      //       "latitude": double.parse(event.latitude.toStringAsFixed(7)),
      //       "longitude": double.parse(event.longitude.toStringAsFixed(7)),
      //       "type": '$type',
      //       "id": id,
      //     });
      // });

      sendPort?.send(event);
    });
  }

  // @override
  // Future<void> onDestroy(DateTime timestamp) async {
  //   print('onDestroy');
  // }

  @override
  void onButtonPressed(String id) async {
    print('onButtonPressed >> $id');
    if (id == 'goOffline') {
      await FlutterForegroundTask.stopService();

    }
  }

  @override
  Future<void> onDestroy(DateTime timestamp, SendPort? sendPort) {
    // TODO: implement onDestroy
    throw UnimplementedError();
  }


}

class BackgroundLocationTripHandler extends TaskHandler {
  @override
  Future<void> onStart(DateTime timestamp, SendPort? sendPort) async {
    // You can use the getData function to get the data you saved.
    final customData =
        await FlutterForegroundTask.getData<String>(key: 'customData');
    print('customData: $customData');
  }

  @override
  Future<void> onEvent(DateTime timestamp, SendPort? sendPort) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    final positionStream = Geolocator.getPositionStream();
    // positionStream.listen((event) async {
    //   TripStorage().readTrip().then((value) {
    //     TripStorage().writeTrip(
    //         value,
    //         {"latitude": event.latitude, "longitude": event.longitude}
    //             .toString());
    //     sendPort?.send(event);
    //   });
    // });
  }

  // @override
  // Future<void> onDestroy(DateTime timestamp) async {
  //   print('onDestroy');
  // }

  @override
  void onButtonPressed(String id) async {
    print('onButtonPressed >> $id');
    if (id == 'goOffline') {
      await FlutterForegroundTask.stopService();
    }
  }

  @override
  Future<void> onDestroy(DateTime timestamp, SendPort? sendPort) {
    // TODO: implement onDestroy
    throw UnimplementedError();
  }
}

void startTimerCallback() {
  // The setTaskHandler function must be called to handle the task in the background.
  FlutterForegroundTask.setTaskHandler(BackgroundTimerHandler());
}

class BackgroundTimerHandler extends TaskHandler {
  int updateCount = 0;

  @override
  Future<void> onStart(DateTime timestamp, SendPort? sendPort) async {
    // You can use the getData function to get the data you saved.
    final customData =
        await FlutterForegroundTask.getData<String>(key: 'customData');
    print('customData: $customData');
  }

  @override
  Future<void> onEvent(DateTime timestamp, SendPort? sendPort) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    // updateCount = await UserStorage().readTimer();
    // UserStorage().writeTimer(updateCount++);
    sendPort?.send(updateCount);
  }

  // @override
  // Future<void> onDestroy(DateTime timestamp) async {
  //
  // }

  @override
  void onButtonPressed(String id) {
    print('onButtonPressed >> $id');
    // if (id == 'goOffline') {
    //   UserStorage().readUser().then((String userInfo) {
    //     FirebaseDatabase.instanceFor(
    //             app: Firebase.app(),
    //             databaseURL: 'https://-default-rtdb.firebaseio.com/')
    //         .ref('driverOnline')
    //         .once()
    //         .then((value) {
    //       if (value.snapshot.hasChild('${userInfo.split(',').first}')) {
    //         FirebaseDatabase.instanceFor(
    //                 app: Firebase.app(),
    //                 databaseURL:
    //                     'https://-default-rtdb.firebaseio.com/')
    //             .ref('driverOnline')
    //             .child('${userInfo.split(',').first}')
    //             .remove()
    //             .then((value) async {
    //           await FlutterForegroundTask.stopService();
    //         });
    //       }
    //     });
    //   });
    // }
  }

  @override
  Future<void> onDestroy(DateTime timestamp, SendPort? sendPort) {
    // You can use the clearAllData function to clear all the stored data.
    // await FlutterForegroundTask.clearAllData();
    // UserStorage().readUser().then((String userInfo) {
    //   FirebaseDatabase.instanceFor(
    //       app: Firebase.app(),
    //       databaseURL: 'https://-default-rtdb.firebaseio.com/')
    //       .ref('driverOnline')
    //       .once()
    //       .then((value) {
    //     if (value.snapshot.hasChild('${userInfo.split(',').first}')) {
    //       FirebaseDatabase.instanceFor(
    //           app: Firebase.app(),
    //           databaseURL:
    //           'https://-default-rtdb.firebaseio.com/')
    //           .ref('driverOnline')
    //           .child('${userInfo.split(',').first}')
    //           .remove()
    //           .then((value) async {
    //         await FlutterForegroundTask.stopService();
    //       });
    //     }
    //   });
    // });
    print('onDestroy');
    throw UnimplementedError();
  }
}
