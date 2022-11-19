import 'package:driver_app/utils/app_colors.dart';
import 'package:driver_app/view/screens/auth/login_screen.dart';
import 'package:driver_app/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../screens/history_screen.dart';
import '../screens/recieved_order_screen.dart';

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
                children: const [
                  Text(
                      "Total orders: 24",
                    style: TextStyle(
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
                children: const [
                  Text(
                      "Total collected money: 97 JOD",
                    style: TextStyle(
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
                children: const [
                  Text(
                      "Total amount: -48 JOD",
                    style: TextStyle(
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
                text: "Home page",
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
                text: "Payment",
                icon:  Icon(
                  Icons.payment,
                  color: AppColors.blue.withOpacity(.7),
                  size: 30,
                ),
                function: () {
                  Navigator.pop(context);
                }),
            contentDrawer(
                context: context,
                text: "Orders history",
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
                text: "Settings",
                icon:  Icon(
                  Icons.settings_applications,
                  color: AppColors.blue.withOpacity(.7),
                  size: 30,
                ),
                function: () {
                  Navigator.pop(context);
                }),
            contentDrawer(
                context: context,
                text: "Logout",
                icon:  Icon(
                  Icons.logout,
                  color: AppColors.blue.withOpacity(.7),
                  size: 30,
                ),
                function: () {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.confirm,
                    text: 'Are you sure do want to logout?',
                    confirmBtnText: 'Yes',
                    cancelBtnText: 'No',
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
                  text: 'Are you sure do want to delete your account?',
                  confirmBtnText: 'Yes',
                  cancelBtnText: 'No',
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
                      children: const [
                        Text(
                          'Delete my account',
                          textAlign: TextAlign.end,
                          style: TextStyle(
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
