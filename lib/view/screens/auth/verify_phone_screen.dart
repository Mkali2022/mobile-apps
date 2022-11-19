
import 'package:driver_app/utils/app_colors.dart';
import 'package:driver_app/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pin_put/pin_put.dart';

import '../../../viewmodel/register_viewmodel.dart';
import '../../../viewmodel/verify_phone_viewmodel.dart';
import '../../widgets/countdown_widget.dart';

class VerifyPhone extends StatefulWidget {
  final String phone;


  VerifyPhone(this.phone);

  @override
  _VerifyPhoneState createState() => _VerifyPhoneState(phone);
}

class _VerifyPhoneState extends State<VerifyPhone> with TickerProviderStateMixin{
  // final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final String phone;

  _VerifyPhoneState(this.phone);


  BoxDecoration get _pinPutDecoration {
    return const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          //                   <--- left side
          color: Colors.black,
          width: 3.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<VerifyPhoneViewModel>(
          init: VerifyPhoneViewModel(phone),
          builder: (controller) {
            return WillPopScope(
              onWillPop: ()async {
                controller.smsController.text='';
                controller.update();
                Get.back();
                return true;
              },
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0, left: 18),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          IconButton(
                              onPressed: () {
                                controller.smsController.text='';
                                controller.update();
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: AppColors.blue,
                                size: 30,
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          const Text("phone authentication",
                              style: TextStyle(
                            color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 19
                          )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          const Text(
                            "We send code to +962700110011 to verify your account, please enter code that received to your mobile number.",
                            style:  TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.normal,
                                fontSize: 16
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                          Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: PinPut(
                                  pinAnimationType: PinAnimationType.rotation,
                                  fieldsCount: 6,
                                  autofocus: true,
                                  onSubmit: (String pin) {
                                    print('PIN $pin');
                                    controller.signInWithPhoneNumber();
                                  },
                                  focusNode: _pinPutFocusNode,
                                  preFilledWidget: Container(
                                    width: MediaQuery.of(context).size.height * 0.02,
                                    height: MediaQuery.of(context).size.height * 0.02,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[700], shape: BoxShape.circle),
                                  ),
                                  controller: controller.smsController,
                                  submittedFieldDecoration: _pinPutDecoration,
                                  textStyle: const TextStyle(fontSize: 20),
                                  selectedFieldDecoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey,
                                        width: 3.0,
                                      ),
                                    ),
                                  ),
                                  followingFieldDecoration: _pinPutDecoration,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                          ),

                          controller.resend
                              ? Center(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(
                                      AppColors.blue)),
                              onPressed: () {
                                controller.verifyPhoneNumber(widget.phone);
                                controller.countdownController = AnimationController(
                                    vsync: this,
                                    duration: const Duration(
                                        seconds: 60)
                                );
                                controller.resend=false;
                                controller.update();
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30),
                                child: Text(
                                  'Resend'.tr,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          )
                              : Row(
                            children: [
                              Text(
                                "Resend Code Within".tr,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              // Countdown(
                              //   isLogin: true,
                              //   animation: StepTween(
                              //     begin: 60,
                              //     end: 0,
                              //   ).animate(controller.countdownController!),
                              // )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                          ),
                          Center(
                            child: buttonLogIn(
                                context: context,
                                text: "Next".tr,
                                function: () {
                                 Get.to(() =>
                                     const HomeScreen());
                                }
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
