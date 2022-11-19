
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../viewmodel/verify_phone_viewmodel.dart';

class Countdown extends AnimatedWidget {
  Countdown( {Key? key, required this.animation,required this.isLogin}) : super(key: key, listenable: animation);
  Animation<int> animation;
  bool isTimeout = false;
  final bool isLogin;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    if (timerText == '0') {
      timerText = '0';
      if(isLogin){
        VerifyPhoneViewModel loginViewModel = Get.find<VerifyPhoneViewModel>();
        loginViewModel.resend = true;
        loginViewModel.update();
      }
    }

    return Text(
      "$timerText",
      style: TextStyle(
        color: isLogin?Colors.black:Colors.white,
        fontSize: 18,
      ),
    );
  }
}
