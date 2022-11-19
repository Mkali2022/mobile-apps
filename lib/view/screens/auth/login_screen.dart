import 'package:driver_app/view/screens/auth/register_screen.dart';
import 'package:driver_app/view/screens/auth/verify_phone_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/pass_text_field.dart';
import 'forget_password.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController userName = TextEditingController();
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 32,
                            offset: const Offset(0, 16),
                            color: Colors.grey.shade300)
                      ],
                  ),
                ),
                const SizedBox(
                  height: 62,
                ),
                const Text(
                  "Login",
                  style: TextStyle(
                      color: AppColors.blue,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 8,
                              offset: const Offset(5,5)
                          )
                        ]
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                          child: PassTextFild(
                            hintText: 'Email',
                            controller: userName,
                            isShowBorder: true,
                            autoValidate: false,
                            isShowSuffixIcon: true,
                            inputAction: TextInputAction.done,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: PassTextFild(
                            hintText: 'Password',
                            controller: password,
                            isShowBorder: true,
                            autoValidate: false,
                            isPassword: true,
                            isShowSuffixIcon: true,
                            inputAction: TextInputAction.done,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(VerifyPhone(""));
                          },
                          child: const CustomButton(
                              title: "Login",
                              color: AppColors.blue),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Align(
                              alignment: Alignment.center,
                              child: TextButton(
                                  onPressed: () {
                                    Get.to(const ForgetPasswordPage());
                                  },
                                  child: const Text(
                                    'Forget Password?',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: AppColors.blue,
                                        fontWeight: FontWeight.bold),
                                  ))),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        InkWell(
                            onTap: () {
                             Get.to(() => RegisterScreen());
                            },
                            child: const CustomButton(
                                title: "Sign up", color: AppColors.blue)),
                        const SizedBox(
                          height: 32,
                        ),
                      ],
                    ),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.all(10.0),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.end,
                //         children: [
                //           Icon(
                //             Icons.language_outlined,
                //             color: AppColors.primeColorsBold,
                //           ),
                //           Align(
                //             child: Text(
                //               "language".tr,
                //               style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   color: AppColors.primeColorsBold),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.end,
                //         children: [
                //           Text(
                //             "EN-AR".tr,
                //             style: const TextStyle(fontWeight: FontWeight.bold),
                //           ),
                //           Align(
                //             child: CupertinoSwitch(
                //               activeColor: Colors.amber,
                //               thumbColor: AppColors.primeColors,
                //               trackColor: AppColors.primeColorsBold,
                //               value: _switchValue,
                //               onChanged: (value) async {
                //                 final sharedPreferences =
                //                 await SharedPreferences.getInstance();
                //                 setState(() {
                //                   _switchValue = value;
                //                   appLanguage = 'en';
                //
                //                   _switchValue
                //                       ? appLanguage = 'ar'
                //                       : appLanguage = 'en';
                //
                //                   _switchValue = value;
                //                   sharedPreferences.setString(
                //                       AppConstants.LANGUAGE_CODE, appLanguage);
                //                   Get.updateLocale(Locale(appLanguage));
                //                   print("$value  $appLanguage");
                //                 });
                //               },
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
