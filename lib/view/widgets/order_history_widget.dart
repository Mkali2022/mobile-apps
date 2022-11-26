import 'package:driver_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHistoryWidget extends StatelessWidget {
  const OrderHistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.containerColor,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "ID: 164",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Wednesday (16/11/2022)",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 0),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.04,
                    height: MediaQuery.of(context).size.height * 0.015,
                    decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      border: Border.all(color: Colors.green)
                    ),
                  ),
                  const SizedBox(width: 5,),
                   Text(
                    "${"Pickup:".tr} Macdonalds\nqueen rania street building no.13",
                    style: const TextStyle(
                      color: AppColors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17,right: 10,top: 0,bottom: 0),
              child: Row(
                children: [
                  Container(
                    width: 1,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration:  const BoxDecoration(
                        color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 0,bottom: 10),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.04,
                    height: MediaQuery.of(context).size.height * 0.015,
                    decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                        border: Border.all(color: Colors.green)
                    ),
                  ),
                  const SizedBox(width: 5,),
                   Text(
                    "${"Drop off:".tr} Amman,abu nsair\ndreams building no.34, apartment no.402",
                    style: const TextStyle(
                      color: AppColors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children:  [
                  Text(
                    "${"Status:".tr} Delivered",
                    style: const TextStyle(
                      color: AppColors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
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
                    "${"Payment method:".tr} Cash",
                    style: const TextStyle(
                      color: AppColors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
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
                    "${"Total amount:".tr} 8.95 JOD",
                    style: const TextStyle(
                      color: AppColors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
