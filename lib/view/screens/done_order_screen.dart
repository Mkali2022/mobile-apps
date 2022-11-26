import 'package:driver_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_button.dart';
import 'home_screen.dart';

class DoneOrderScreen extends StatelessWidget {
  const DoneOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title:   Text(
          "${"Order".tr}#164",
          style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Get.to(()=>const HomeScreen());
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40,),
          Container(
            height: 270,
            width: Get.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/verified.gif"
                    )
                )
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Text(
                  "${"Your order".tr}#164${"has been success".tr}",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Text(
                  "We appreciate your effort".tr,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: InkWell(
              onTap: (){
                Get.to(()=>const HomeScreen());
              },
              child:   CustomButton(
                  title: "Confirm".tr,
                  color: AppColors.blue
              ),
            ),
          ),
        ],
      ),
    );
  }
}
