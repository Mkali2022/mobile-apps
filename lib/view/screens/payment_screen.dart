import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../viewmodel/payment_viewmodel.dart';
import 'add_card_page.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.containerColor,
        centerTitle: true,
        title:   Text(
          "Payment".tr,
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
      body: GetBuilder<PaymentViewModel>(
        init: PaymentViewModel(),
          builder:(controller){
          return    Column(
            children: [
              Container(
                height: Get.height * .20,
                width: Get.width,
                color: AppColors.containerColor,
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'Credit cards'.tr,
                        style: TextStyle(
                            color: AppColors.blue,
                            fontSize:
                            MediaQuery.of(context).size.width *
                                .06),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              !controller.isNoPayment
                  ?  Center(child:  Text("No Credit card".tr))
                  : Column(
                    children: [
                      CreditCardWidget(
                        glassmorphismConfig:null,
                        cardNumber: "4444112233445566",
                        expiryDate: "11/24",
                        cardHolderName: "Abdullah alshaikh",
                        cvvCode: "123",
                        showBackView: true,
                        obscureCardNumber: true,
                        obscureCardCvv: true,
                        isHolderNameVisible: true,
                        textStyle: const TextStyle(color: AppColors.cyan),
                        cardBgColor: AppColors.cyan,
                        backgroundImage: 'assets/card_bg.png',
                        isSwipeGestureEnabled: true,
                        onCreditCardWidgetChange:
                            (CreditCardBrand) {},
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.defaultDialog(
                                title:"delete credit card".tr,
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                     Text(
                                         "are you sure deleting credit card".tr),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        MaterialButton(
                                          shape:
                                          RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(
                                                  10)),
                                          color: AppColors.blue,
                                          onPressed: () {
                                            // controller
                                            //     .deletePayment();
                                          },
                                          child: Text(
                                            'Confirm'.tr,
                                            style: const TextStyle(
                                                color:
                                                Colors.white),
                                          ),
                                        ),
                                        MaterialButton(
                                          shape:
                                          RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(
                                                  10)),
                                          color: AppColors.profileBox1,
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text(
                                            'Cancel'.tr,
                                            style: const TextStyle(
                                                color:
                                                Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ));
                          },
                          child: Column(
                            children: [
                              const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              Text(
                                'Delete card'.tr,
                                style: const TextStyle(color: Colors.red),
                              )
                            ],
                          ),
                        ),
                      )
                      // buildTop(size),
                      // buildBody(size)
                    ],
                  ),

            ],
          );
          }
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Add new card".tr,
                style: const TextStyle(
                    color: AppColors.blue,
                    fontSize: 19,
                    fontWeight: FontWeight.bold)),
          ),
          GestureDetector(
            onTap: () {
              Get.to(AddCreditCardPage());
            },
            child: const CircleAvatar(
              maxRadius: 25,
              backgroundColor: AppColors.blue,
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
          )
        ],
      ),

    );
  }
}
