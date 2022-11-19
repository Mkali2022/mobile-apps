import 'dart:async';
import 'dart:developer';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../helper/helper.dart';

class VerifyPhoneViewModel extends GetxController
    with GetTickerProviderStateMixin ,CodeAutoFill{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late AnimationController animationController;
  final TextEditingController smsController = TextEditingController();
  String _verificationId = '';
  final SmsAutoFill autoFill = SmsAutoFill();
  final SmsAutoFill autoFillSms = SmsAutoFill();
  AnimationController? countdownController;
  bool resend = false;
  final String phone;
  PhoneAuthCredential? _phoneAuthCredential;
  VerifyPhoneViewModel(this.phone);

  @override
  void codeUpdated() {
    smsController.text = code!;
    logMessage('GetOtp: $code');
    login(phone);
  }

  @override
  void dispose() {
    countdownController!.dispose();
    animationController.dispose();
    super.dispose();
  }

  // @override
  // void onInit() {
  //
  //   listenForCode();
  //   animationController = AnimationController(
  //       duration: Duration(milliseconds: 1000), vsync: this);
  //   // TODO: implement initState
  //   animationController.forward();
  //   autoFillSms.code.listen((event) {
  //    log('$event',name: 'autoFillSms');
  //     smsController.text = event;
  //     update();
  //   });
  //   countdownController =
  //       AnimationController(vsync: this, duration: Duration(seconds: 60));
  //
  //   super.onInit();
  //  Future.delayed(Duration.zero,(){
  //    verifyPhoneNumber(phone);
  //  });
  // }

  runTimer() {
    countdownController!.forward().whenComplete(() {
      resend = true;
      update();
    }).catchError((e) {});
  }


  login(String phone) async {
    // final prefs = await SharedPreferences.getInstance();
    // var body = {
    //   'phone_number': '${phone.replaceAll(' ', '')}',
    //   'platform': '$devicePlatform',
    //   'timezone': '${DateTime.now()}',
    //   'app_version': '$version',
    //   'app_token': '$deviceToken',
    // };
    // APIRequest()
    //     .multiPartMethodRequest(ApiUrls.login, {}, body, null)
    //     .then((value) async {
    //   UserApp userApp = UserApp.fromJson(value);
    //   log('${userApp.toJson()}', name: 'UserLogin');
    //   if (userApp.token != null) {
    //     print('driverIdentityNumber: ${userApp.user!.driverIdentityNumber}');
    //     print('vehicleSequenceNumber: ${userApp.user!.vehicleSequenceNumber}');
    //     prefs.setString('userToken', userApp.token!);
    //     prefs.setString('driverIdentityNumber', userApp.user!.driverIdentityNumber!);
    //     prefs.setString('vehicleSequenceNumber', userApp.user!.vehicleSequenceNumber??'');
    //     prefs.setString('user', json.encode(userApp.user!.toJson()));
    //     Get.offAll(HomePageScreen());
    //   }else if (value["message"] == "Your account is not approved yet"){
    //     print(value["message"]);
    //     Get.snackbar(
    //         'حسابك غير مفعل', "لقد قمت بتعطيل حسابك لاُعادة تفعيله يرجي التواصل مع الادارة");
    //   }
    //   else {
    //     Get.snackbar(
    //         'حطأ', "حدث خطأ في عملية تسجيل الدخول يرجى المحاولة ثانية");
    //   }
    // });
  }

  void verifyPhoneNumber(String phone) async {
   Helper().loading();
    _verificationId = '';
    update();

    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      _phoneAuthCredential = phoneAuthCredential;
      await _auth.signInWithCredential(phoneAuthCredential);
      logMessage(
          "Phone number automatically verified and user signed in: ${_auth.currentUser!.uid}");
    };
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      logMessage(
          'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
    };

    void codeSent(String verificationId, [int? forceResendingToken]) async {
      Get.back();
      logMessage('Please check your phone for the verification code.');
      _verificationId = verificationId;
      runTimer();
      update();
    }

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      try {
        logMessage("verification code: " + verificationId);
        _verificationId = verificationId;
        try {
          if(_phoneAuthCredential!=null)
            verificationCompleted(_phoneAuthCredential!);
        } on Exception catch (e) {
          // TODO
        }
      } on Exception catch (e) {
        logMessage("PhoneCode Auto Retrieval Timeout: ${e}");
      }
    };

    try {
      print(
          'final Phone: $phone');
      await _auth.verifyPhoneNumber(
          phoneNumber:phone,
          timeout: const Duration(seconds: 60),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      logMessage("Failed to Verify Phone Number: ${e}");
    }
  }

  void logMessage(String message) {
    log(message, name: 'OTP');
  }

  void signInWithPhoneNumber() async {
    // Helper().loading();
    print('_verificationId $_verificationId');
    print('smsController ${smsController.text}');
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsController.text,
      );

      final User user = (await _auth.signInWithCredential(credential)).user!;
      logMessage("Successfully signed in UID: ${user.uid}");
      login(user.phoneNumber!);
    } catch (e) {
      Get.back();
      smsController.clear();
      // Get.deleteAll();
      // Get.offAll(LogInPhone());
      Helper().showError('التحقق من الهاتف', 'فشل التحقق من رقم الهاتف او رمز التحقق غير صحيح ');
      logMessage("Failed to sign in: " + e.toString());
    }
  }

}
