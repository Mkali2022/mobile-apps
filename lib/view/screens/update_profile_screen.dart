import 'package:driver_app/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../viewmodel/update_profile_viewmodel.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title:   Text(
          "Update info".tr,
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
      body: GetBuilder<UpdateProfileViewModel>(
        init: UpdateProfileViewModel(),
          builder:(controller){
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "First name".tr,
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
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 45,
                            child: TextFormField(
                              controller: controller.firstNameController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.go,
                              style: const TextStyle(
                                  color: Colors.black54
                              ),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(13.0),
                                  ),
                                  fillColor: AppColors.white,
                                  filled: true),
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(
                                    RegExp(r'[/\\]')),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Last name".tr,
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
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 45,
                            child: TextFormField(
                              controller: controller.lastNameController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.go,
                              style: const TextStyle(
                                  color: Colors.black54
                              ),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(13.0),
                                  ),
                                  fillColor: AppColors.white,
                                  filled: true),
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(
                                    RegExp(r'[/\\]')),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Email".tr,
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
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 45,
                            child: TextFormField(
                              controller: controller.emailController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.go,
                              style: const TextStyle(
                                color: Colors.black54
                              ),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(13.0),
                                  ),
                                  fillColor: AppColors.white,
                                  filled: true),
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(
                                    RegExp(r'[/\\]')),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Address".tr,
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
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 45,
                            child: TextFormField(
                              controller: controller.addressController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.go,
                              style: const TextStyle(
                                  color: Colors.black54
                              ),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(13.0),
                                  ),
                                  fillColor: AppColors.white,
                                  filled: true),
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(
                                    RegExp(r'[/\\]')),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Date of birth".tr,
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
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Row(
                      children: [
                       InkWell(
                         onTap: (){
                           controller.selectDate(context);
                         },
                         child: Container(
                           height: 45,
                           width: Get.width *0.94,
                           decoration: BoxDecoration(
                             color: AppColors.white,
                             borderRadius: BorderRadius.circular(10)
                           ),
                           child: Padding(
                             padding: const EdgeInsets.all(10),
                             child: Text(
                               controller.age ?? 'mm-dd-yyyy',
                               style: const TextStyle(color: Colors.black54),
                             ),
                           ),
                         ),
                       )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
      )

    );
  }
}
