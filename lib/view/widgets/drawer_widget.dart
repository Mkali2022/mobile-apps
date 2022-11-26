import 'package:driver_app/utils/app_colors.dart';
import 'package:driver_app/view/screens/auth/login_screen.dart';
import 'package:driver_app/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../screens/history_screen.dart';
import '../screens/notifications_screen.dart';
import '../screens/payment_screen.dart';
import '../screens/settings_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.72,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height * .25,
              width: Get.width,
              color: AppColors.containerColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children:  [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children:  [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                                "Abdullah Alshaikh",
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColors.blue
                              ),
                            ),
                            Text(
                              "abdullahalshaikhh@outlook.com",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 13,
                                  fontFamily: ""
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Row(
                children:  [
                  Text(
                    "${"Total orders:".tr} 24",
                    style: const TextStyle(
                      color: Colors.black54,
                        fontSize: 13,
                      fontFamily: ""
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Row(
                children:  [
                  Text(
                       "${"Total collected money:".tr}97 JOD",
                    style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 13,
                        fontFamily: ""
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Row(
                children:  [
                  Text(
                      "${"Total amount:".tr} -48 JOD",
                    style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 13,
                        fontFamily: ""
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.black54,
            ),
            SizedBox(
              height: Get.height *.03,
            ),
            contentDrawer(
                context: context,
                text: "Home page".tr,
                icon:  Icon(
                  Icons.home,
                  color: AppColors.blue.withOpacity(.7),
                  size: 30,
                ),
                function: () {
                  // Navigator.pop(context);
                  Get.to(const HomeScreen());
                }),
            contentDrawer(
                context: context,
                text: "Notifications".tr,
                icon:  Icon(
                  Icons.notifications,
                  color: AppColors.blue.withOpacity(.7),
                  size: 30,
                ),
                function: () {
              Get.to(()=>const NotificationsScreen());
                }),
            contentDrawer(
                context: context,
                text: "Payment".tr,
                icon:  Icon(
                  Icons.payment,
                  color: AppColors.blue.withOpacity(.7),
                  size: 30,
                ),
                function: () {
                  Get.to(()=> const PaymentScreen());
                }),
            contentDrawer(
                context: context,
                text: "Orders history".tr,
                icon:  Icon(
                  Icons.history,
                  color: AppColors.blue.withOpacity(.7),
                  size: 30,
                ),
                function: () {
                 Get.to(()=>const HistoryScreen());
                }),
            contentDrawer(
                context: context,
                text: "Settings".tr,
                icon:  Icon(
                  Icons.settings_applications,
                  color: AppColors.blue.withOpacity(.7),
                  size: 30,
                ),
                function: () {
                  Get.to(()=>const SettingsScreen());
                }),
            contentDrawer(
                context: context,
                text: "Logout".tr,
                icon:  Icon(
                  Icons.logout,
                  color: AppColors.blue.withOpacity(.7),
                  size: 30,
                ),
                function: () {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.confirm,
                    text: 'Are you sure do want to logout?'.tr,
                    confirmBtnText: 'Yes'.tr,
                    cancelBtnText: 'No'.tr,
                    confirmBtnColor: Colors.green,
                    onConfirmBtnTap: (){
                      Get.to(()=> LoginScreen());
                    }
                  );
                }),
            InkWell(
              onTap: (){
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.confirm,
                  text: 'Are you sure do want to delete your account?'.tr,
                  confirmBtnText: 'Yes'.tr,
                  cancelBtnText: 'No'.tr,
                  confirmBtnColor: Colors.green,
                    onConfirmBtnTap: (){
                      Get.to(()=> LoginScreen());
                    }
                );
              },
              child: ListTile(
                title: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text(
                          'Delete my account'.tr,
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget contentDrawer(
      {required BuildContext context,
        required String text,
        required Widget icon,
        required Function function}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap:() => function(),
        child: ListTile(
          trailing: icon,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  color: AppColors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
