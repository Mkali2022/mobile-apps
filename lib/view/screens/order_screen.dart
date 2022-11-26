import 'package:driver_app/helper/map_utils.dart';
import 'package:driver_app/utils/app_colors.dart';
import 'package:driver_app/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../viewmodel/order_viewmodel.dart';
import 'done_order_screen.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderViewModel>(
      init: OrderViewModel(),
        builder:(controller){
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title:   Text(
                "${"Order".tr} #164",
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
              elevation: 0,
              leading: InkWell(
                onTap: (){
                  // Get.to(()=>const HomeScreen());
                },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              ),
              actions: [
               InkWell(
                 onTap: (){
                   Get.defaultDialog(
                     backgroundColor: Colors.transparent,
                     contentPadding: EdgeInsets.zero,
                     titlePadding: EdgeInsets.zero,
                     title: '',
                     content: Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         color: Colors.grey[100],
                         // shape: BoxShape.rectangle,
                       ),
                       child: Stack(
                           children: [
                             Container(
                               decoration: const BoxDecoration(
                                   borderRadius: BorderRadius.only(
                                       topLeft: Radius.circular(20),
                                       topRight: Radius.circular(20)),
                                 color:AppColors.blue,
                                 // shape: BoxShape.rectangle,
                               ),
                               height: Get.height * 0.12,
                             ),
                             Positioned(
                               top: 10,
                               left: 10,
                               child: IconButton(
                                 icon: const Icon(
                                   Icons.cancel,
                                   size: 30,
                                   color: Colors.white,
                                 ),
                                 onPressed: () {
                                   Navigator.of(context).pop();
                                 },
                               ),
                             ),
                             Positioned(
                               top: 50,
                               right:  100,
                               child: CircleAvatar(
                                 backgroundColor: Colors.white,
                                 radius: 40,
                                 child: SizedBox(
                                   height: 35,
                                   width: 35,
                                   child: Image.asset(
                                     "assets/support.png",
                                     color: AppColors.blue,
                                   ),
                                 ),
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.fromLTRB(
                                   30, 150, 30, 0),
                               child: Column(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.fromLTRB(
                                         10, 0, 10, 0),
                                     child: TextFormField(
                                       // controller: messageController,
                                       decoration: InputDecoration(
                                         fillColor: Colors.white,
                                         filled: true,
                                         border: OutlineInputBorder(
                                             borderRadius:
                                             BorderRadius.circular(
                                                 10)),
                                         labelText: 'write'.tr,
                                       ),
                                       maxLines: 4,
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.fromLTRB(
                                         0, 40, 0, 20),
                                     child: SizedBox(
                                       width: 200,
                                       child: ElevatedButton(
                                         onPressed: () async {

                                         },
                                         style: ElevatedButton.styleFrom(
                                             shape: const StadiumBorder(),
                                             primary: Colors.green[500]),
                                         child:  Text('Send'.tr,
                                             style: const TextStyle(
                                                 fontSize: 20,
                                                 color: Colors.black
                                             )
                                         ),
                                       ),
                                     ),
                                   )
                                 ],
                               ),
                             )
                           ]),
                     ),
                   );
                 },
                 child: Padding(
                   padding: const EdgeInsets.all(10),
                   child: SizedBox(
                     height: 35,
                     width: 35,
                     child: Image.asset(
                         "assets/support.png",
                       color: AppColors.blue,
                     ),
                   ),
                 ),
               )
              ],
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: Colors.black54
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2,
                                          color: AppColors.blue
                                      ),
                                      shape: BoxShape.circle
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      'assets/restaurant.png',
                                      color: AppColors.blue,
                                      height: 60,
                                    ),
                                  ),
                                ),
                              ),
                              const Text(
                                "MacDonald's",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.blue
                                ),
                              ),
                              SizedBox(width: Get.width *.25,),
                              InkWell(
                                onTap: (){
                                  launch("tel:0613113113");
                                },
                                child: const Icon(
                                  Icons.call,
                                  color: AppColors.blue,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(
                                  Icons.chat_rounded,
                                  color: AppColors.blue,
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Text(
                                  "Pickup information".tr,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    MapUtils.openMap(
                                        const LatLng(31.995236, 35.911773),
                                        31.997661, 35.862321
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:  [
                                          Text(
                                            "Map it".tr,
                                            style: const TextStyle(
                                                color: Colors.white
                                            ),
                                          ),
                                          const Icon(Icons.navigation_rounded,color: Colors.white,size: 20,)
                                        ],
                                      ),
                                    ),
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
                                  "MacDonald's, queen rania street 13",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.blue.withOpacity(.5)
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
                                  "0613113113",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.blue.withOpacity(.5)
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: Colors.black54
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Text(
                                  "Delivery information".tr,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    MapUtils.openMap(
                                        const LatLng(31.995236, 35.911773),
                                        31.997661, 35.862321
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:  [
                                          Text(
                                            "Map it".tr,
                                            style: const TextStyle(
                                                color: Colors.white
                                            ),
                                          ),
                                          const Icon(Icons.navigation_rounded,color: Colors.white,size: 20,)
                                        ],
                                      ),
                                    ),
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
                                  "Abdullah Alshaikh",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.blue.withOpacity(.5)
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
                                  "+962797540804",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.blue.withOpacity(.5)
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
                                  "abdullahalshaikh@gmail.com",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.blue.withOpacity(.5)
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
                                  "Amman,amman,Abu nsair alrawabi\nbuilding office no.10,F34H+M7P",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.blue.withOpacity(.5)
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: Colors.black54
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                Text(
                                  "Order information".tr,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                Text(
                                  "item: Big Tasty",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.blue.withOpacity(.5)
                                  ),
                                ),
                                Text(
                                  "6.25 JOD",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.blue.withOpacity(.5)
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children:  [
                                Text(
                                  "Quantity: 2",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.blue.withOpacity(.5)
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                Text(
                                  "item: Pepsi",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.blue.withOpacity(.5)
                                  ),
                                ),
                                Text(
                                  "0.70 JOD",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.blue.withOpacity(.5)
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children:  [
                                Text(
                                  "Quantity: 2",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.blue.withOpacity(.5)
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10,),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          children:  [
                            Text(
                              "Payment Method".tr,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Cash on delivery",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.blue.withOpacity(.5)
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          children:  [
                            Text(
                              "Total Price".tr,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "8.95 JOD",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.blue.withOpacity(.5)
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(),
                  ),
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      if(controller.index != 3) {
                        controller.index ++;
                      }else{
                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.loading,
                            text: 'Please wait..'.tr,
                        );
                        Future.delayed(const Duration(seconds: 3)).whenComplete(() {
                          controller.index =0;
                          Get.to(const DoneOrderScreen());
                        });
                      }
                      controller.update();
                    },
                    child:  CustomButton(
                        title: controller.status[controller.index],
                        color: Colors.green
                    ),
                  ),
                  const SizedBox(height: 10,),
                ],
              ),
            ),
          );
        }
    );

  }
}
