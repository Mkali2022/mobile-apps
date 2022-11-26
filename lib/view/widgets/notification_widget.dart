import 'package:driver_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(12)
      ),
      child: ListTile(
        title: const Text(
          "Notification title",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black
          ),
        ),
        subtitle: Text(
          "This is notification content..",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: AppColors.blue.withOpacity(.5)
          ),
        ),
        leading: Container(
          height: 50,
          decoration:  BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.blue,
            border: Border.all(color: Colors.white,width: 2)
          ),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.notifications,
              size: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
