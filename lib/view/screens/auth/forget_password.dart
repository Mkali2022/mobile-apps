
import 'package:driver_app/view/widgets/custom_button.dart';
import 'package:driver_app/viewmodel/register_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../utils/app_colors.dart';
import 'change_password_screen.dart';
String verifyNumber = '';
class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController phoneController = TextEditingController();
  PhoneNumber theRealPhone = PhoneNumber();
  final formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarSign(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: GetBuilder<RegisterViewModel>(
               init: RegisterViewModel("","","SA"),
                  builder: (controller)=>
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: Get.height * .05,
                          ),
                           Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("What is your phone number?".tr,
                                style: const TextStyle(
                                    color: AppColors.blue,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w400)),
                          ),
                           Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Tap Get Started to get an SMS confirmation to help you use OTP. We would like your phone number.".tr,
                              style: const TextStyle(color: AppColors.blue),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * .05,
                          ),
                          Container(
                            margin: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                              child: GestureDetector(
                                onTap: () async {
                                  print('onTap');
                                  // if (!controller.isFilledAuto) {
                                  //   controller.phoneController.text =
                                  //       (await controller.autoFill.hint) ??
                                  //           '';
                                  //   controller.isFilledAuto = true;
                                  //   controller.update();
                                  //   controller.phoneController.text =
                                  //       controller
                                  //           .PhoneNumberWithoutCountryCode(
                                  //           controller
                                  //               .phoneController.text);
                                  // }
                                },
                                child: InternationalPhoneNumberInput(
                                  onInputChanged: (value) {
                                    controller.theRealPhone = value;
                                    controller.prefixNumber = value.dialCode!;
                                    controller.update();
                                  },
                                  selectorTextStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.0,
                                    height: 2,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  initialValue: controller.dealCode,
                                  errorMessage: '',
                                  textFieldController:
                                  controller.phoneController,
                                  inputBorder: InputBorder.none,
                                  inputDecoration:  InputDecoration(
                                    border: const OutlineInputBorder(),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorStyle: const TextStyle(height: 0),
                                    labelStyle:const TextStyle(color: Colors.black,fontSize: 17,height: 3),
                                    contentPadding: const EdgeInsets.only(bottom: 12,left: 8,right: 8),
                                    hintStyle:
                                    const TextStyle(color: Color(0xFFACACAC), fontSize: 14),
                                    hintText: "Phone Number".tr,
                                  ),
                                  selectorConfig: const SelectorConfig(
                                    selectorType: PhoneInputSelectorType.DIALOG,
                                    useEmoji: true,
                                  ),
                                  // maxLength: 10,
                                  validator: (val) {
                                    if (val!.length < 9) {
                                      return "";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          if (controller.phoneError != null)
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                textDirection:
                                controller.isRTL(controller.phoneError!)
                                    ? TextDirection.rtl
                                    : TextDirection.ltr,
                                children: [
                                  Text(
                                    '${controller.phoneError}',
                                    textDirection:
                                    controller.isRTL(controller.phoneError!)
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                    style: const TextStyle(color: Colors.redAccent),
                                  ),
                                ],
                              ),
                            ),
                          SizedBox(
                            height: Get.height * .05,
                          ),
                          InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                  String _mob = controller.phoneController.text;
                                  if (_mob.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                      content: Text("Phone cannot be empty".tr),
                                      backgroundColor: Colors.red,
                                    ));
                                  }else{
                                    Get.to(const ChangePasswordScreen());
                                  }
                              },
                              child:  CustomButton(
                                title: "Next".tr,
                                color: AppColors.blue,
                              )),
                        ],
                      ),
              )

            ),
          ),
        ),
      ),
    );
  }

  AppBar appBarSign() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        '',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.blueGrey.shade400,
        ),
      ),
      automaticallyImplyLeading: false,
      leading: IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
          size: 30,
          color: AppColors.blue,
        ),
      ),
    );
  }

  Widget phoneCustom(var controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(0x20ffffff),
            borderRadius: BorderRadius.circular(5),
          ),
        child: InternationalPhoneNumberInput(
          onInputChanged: (value) {
            theRealPhone = value;
            print('$theRealPhone');
          },
          textStyle: const TextStyle(color: Colors.grey),
          selectorTextStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
          initialValue: PhoneNumber(isoCode: 'SA'),
          textFieldController: phoneController,
          inputDecoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.DIALOG,
            useEmoji: true,
          ),
          selectorButtonOnErrorPadding: 1,

          // maxLength: 10,
          validator: (val) {
            if (val!.length < 9) {
              return "phoneNumber Not Valid".tr;
            }
            return null;
          },
        ),
      ),
    );
  }
}
