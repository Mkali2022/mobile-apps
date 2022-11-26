import 'package:driver_app/view/screens/auth/login_screen.dart';
import 'package:driver_app/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../widgets/pass_text_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController password=TextEditingController();
  TextEditingController repass=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSign(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Update Password".tr,
                      style: const TextStyle(
                          color: AppColors.blue,
                          fontSize: 32,
                          fontWeight: FontWeight.w400)),
                ),
                SizedBox(
                  height: Get.height * .2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: PassTextFild(
                    hintText: 'Password'.tr,
                    controller: password,
                    isShowBorder: true,
                    isPassword: true,
                    isShowSuffixIcon: true,
                    inputAction: TextInputAction.done,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: PassTextFild(
                    hintText: 'Re-Password'.tr,
                    controller: repass,
                    isShowBorder: true,
                    isPassword: true,
                    isRepass: true,
                    originalPass: password.text,
                    isShowSuffixIcon: true,
                    inputAction: TextInputAction.done,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: (){
                    Get.to(LoginScreen());
                    },
                    child:  CustomButton(
                      title: "Save".tr,
                      color: AppColors.blue
                    )
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  AppBar appBarSign() {
    return AppBar(
      backgroundColor: Colors.transparent,
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
}
