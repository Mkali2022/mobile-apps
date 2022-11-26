import 'package:driver_app/utils/app_colors.dart';
import 'package:driver_app/view/screens/update_password_screen.dart';
import 'package:driver_app/view/screens/update_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'language_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Settings".tr,
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: (){
                Get.to(()=>const UpdateProfileScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Update info".tr,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: AppColors.blue
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: (){
                Get.to(()=>const UpdatePasswordScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Change password".tr,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: AppColors.blue
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: (){
                Get.to(()=>const LanguageScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Language".tr,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: AppColors.blue
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
