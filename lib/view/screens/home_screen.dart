import 'package:driver_app/view/screens/recieved_order_screen.dart';
import 'package:driver_app/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../utils/app_colors.dart';
import '../widgets/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
        builder:(controller){
          return Scaffold(
            key: scaffoldKey,
            drawer: const DrawerWidget(),
            body: Stack(
              children: [
                SizedBox(
                  height: Get.height,
                  child: GoogleMap(
                    zoomControlsEnabled: false,
                    myLocationButtonEnabled: false,
                    // markers:
                    // controller.markers.union(markersTrip),
                    initialCameraPosition: CameraPosition(
                      target: controller.currentLocation,
                      zoom: 16.0,
                    ),
                    mapType: MapType.normal,
                    // myLocationButtonEnabled: true,
                    onMapCreated: controller.onMapCreated,
                    myLocationEnabled: true,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      if (controller.controller != null) {
                        controller.controller!.animateCamera(
                            CameraUpdate.newCameraPosition(
                                CameraPosition(
                                    target: controller
                                        .currentLocation,
                                    zoom: 16)));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(1000)),
                        color: AppColors.blue.withOpacity(.5),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.gps_fixed_rounded,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          scaffoldKey.currentState?.openDrawer();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(1000)),
                            color: AppColors.blue,
                            child:  Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                "assets/hamburger.png",
                                color: Colors.white,
                                height: 25,
                              )
                            ),
                          ),
                        ),
                      ),
                      controller.remove && !controller.online?
                      GestureDetector(
                        onTap: (){
                          Get.to(const ReceivedOrderScreen());
                        },
                        onVerticalDragStart: (v){
                          print(v);
                          controller.remove = !controller.remove;
                          controller.update();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(1000)),
                              color: Colors.grey.withOpacity(.2),
                              elevation: 0.1,
                              child:   Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 65.0,vertical: 10),
                                  child: Text(
                                    "You have new order!\nTap for info".tr,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: AppColors.blue,
                                        fontSize: 20
                                    ),
                                  )
                              ),
                            ),
                          ],
                        ),
                      ):Container(),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      if(!controller.online){
                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.confirm,
                            text: 'Are you sure do want to make your status offline! you will not be able to receive orders until you back online again.'.tr,
                            confirmBtnText: 'Yes'.tr,
                            cancelBtnText: 'No'.tr,
                            confirmBtnColor: Colors.green,
                            onConfirmBtnTap: (){
                              controller.online = !controller.online;
                              controller.update();
                              Get.back();
                            }
                        );
                      }else{
                        controller.online = !controller.online;
                        controller.update();
                      }

                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(1000)),
                      color:controller.online?Colors.green: Colors.red,
                      child:   Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0,vertical: 10),
                        child: Text(
                          controller.online?"Online".tr:"Offline".tr,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20
                          ),
                        )
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
    );

  }
}
