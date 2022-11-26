import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/notification_widget.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title:   Text(
          "Notifications".tr,
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
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 0),
          itemBuilder: (context,index){
            return Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 3,bottom: 3,left: 7,right: 7),
                  child: NotificationWidget(),
                ),
                Divider()
              ],
            );
          }
      ),
    );
  }
}
