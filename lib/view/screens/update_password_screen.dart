import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/pass_text_field.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController password = TextEditingController();
    TextEditingController newPassword = TextEditingController();
    TextEditingController newRePassword = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title:   Text(
          "Update Password".tr,
          style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
        child: CustomButton(
          title: "Save".tr,
          color: AppColors.blue,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Current Password".tr,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: AppColors.blue
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: PassTextFild(
                hintText: "*********",
                controller: password,
                isShowBorder: true,
                autoValidate: false,
                isPassword: true,
                isShowSuffixIcon: true,
                inputAction: TextInputAction.done,
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "New Password".tr,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: AppColors.blue
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: PassTextFild(
                hintText: "*********",
                controller: newPassword,
                isShowBorder: true,
                autoValidate: false,
                isPassword: true,
                isShowSuffixIcon: true,
                inputAction: TextInputAction.done,
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Re-new Password".tr,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: AppColors.blue
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: PassTextFild(
                hintText: "*********",
                controller: newRePassword,
                isShowBorder: true,
                autoValidate: false,
                isPassword: true,
                isShowSuffixIcon: true,
                inputAction: TextInputAction.done,
              ),
            ),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
