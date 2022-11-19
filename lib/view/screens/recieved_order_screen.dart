import 'package:driver_app/view/screens/home_screen.dart';
import 'package:driver_app/view/widgets/drawer_widget.dart';
import 'package:driver_app/viewmodel/recived_order_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../utils/app_colors.dart';
import 'order_screen.dart';

class ReceivedOrderScreen extends StatefulWidget {
  const ReceivedOrderScreen({Key? key}) : super(key: key);

  @override
  State<ReceivedOrderScreen> createState() => _ReceivedOrderScreenState();
}

class _ReceivedOrderScreenState extends State<ReceivedOrderScreen> {
  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return GetBuilder<ReceivedOrderViewModel>(
      init: ReceivedOrderViewModel(),
        builder:(controller){
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            drawer: const DrawerWidget(),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton:
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Get.to(const HomeScreen());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(1000)
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                        child: Text(
                          "Reject",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 19
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width:  Get.width * 0.2,
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(const OrderScreen());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(1000)
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                        child: Text(
                          "Accept",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Row(
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
                  ],
                ),
                Container(
                  height: 150,
                  width: Get.width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/fireworks-.gif"
                          )
                      )
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "New Order!",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                ClipRRect(
                  child: Container(
                    width: Get.width * 0.9,
                    decoration: BoxDecoration(
                      color: AppColors.containerColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        ListTile(
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Macdonalds",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "queen rania street building no.13",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          title: const Text(
                            "From",
                            style: TextStyle(color: Colors.grey),
                          ),
                          leading: Container(
                            width: MediaQuery.of(context).size.width * 0.03,
                            height: MediaQuery.of(context).size.height * 0.01,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: AppColors.blue),
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Amman,abu nsair",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "dreams building no.34, apartment no.402",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          title: const Text(
                            "To",
                            style: TextStyle(color: Colors.grey),
                          ),
                          leading: Container(
                            width: MediaQuery.of(context).size.width * 0.03,
                            height: MediaQuery.of(context).size.height * 0.01,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: AppColors.blue),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                          child: SizedBox(
                            height: 200,
                            child: IgnorePointer(
                              child: GoogleMap(
                                  markers: controller.markers,
                                  zoomControlsEnabled: true,
                                  // polylines: Set.from(polyline),
                                  onMapCreated: controller.onMapCreated,
                                  initialCameraPosition: CameraPosition(
                                      zoom: 12,
                                      target: controller.currentLocation)
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
    );

  }
}
