
import 'package:driver_app/utils/app_colors.dart';
import 'package:driver_app/view/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../viewmodel/register_viewmodel.dart';


class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key, this.phone, this.prefix, this.deal}) : super(key: key);
  final String? phone;
  final String? prefix;
  final String? deal;
  final secondFormKey=GlobalKey<FormState>();
  final firstFormKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterViewModel>(
      init: RegisterViewModel(phone,prefix,deal),
      builder: (controller) => WillPopScope(
        onWillPop: () async {
          if(controller.registerStep == 2) {
            controller.registerStep = 1;
            controller.update();
          }
          else{
            Get.back();
          }
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: (){
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios,color: AppColors.blue,),
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: controller.registerStep == 1
                  ? Form(
                key: firstFormKey,
                    child: Column(
                        children: [
                          Center(
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height: MediaQuery.of(context).size.width * 0.25,
                                decoration: const BoxDecoration(
                                 ),
                              child:  const Center(
                                child: Text(
                                  "MAT\nDRIVERS",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blue
                                  ),
                                ),
                              ),
                               ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset:
                                      const Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                              child:TextFormField(
                                validator: (value) {
                                  if(value==''||value==null||value==' ')
                                    return'';
                                  else return null;
                                },
                                decoration:  InputDecoration(
                                  hintText: 'First name'.tr,
                                  label: Text('First name'.tr),
                                  border: const OutlineInputBorder(),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorStyle: const TextStyle(height: 0),
                                  labelStyle:const TextStyle(color: Colors.black),
                                  contentPadding: const EdgeInsets.only(bottom: 0,left: 8,right: 8),
                                  hintStyle:
                                  const TextStyle(color: Color(0xFFACACAC), fontSize: 14),
                                ),
                                textDirection: controller
                                        .isRTL(controller.fNameController.text)
                                    ? TextDirection.rtl
                                    : TextDirection.ltr,
                                onChanged: (value) {
                                  controller.fNameController.text = value.trim();
                                  controller.update();
                                },
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset:
                                      const Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                              child:TextFormField(


                                validator: (value) {
                                  if(value==''||value==null||value==' ')
                                    return'';
                                  else return null;
                                },
                                decoration:  InputDecoration(
                                  hintText: 'Last name'.tr,
                                  label: Text('Last name'.tr),
                                  border: const OutlineInputBorder(),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorStyle: const TextStyle(height: 0),
                                  labelStyle:const TextStyle(color: Colors.black),
                                  contentPadding: const EdgeInsets.only(bottom: 0,left: 8,right: 8),
                                  hintStyle:
                                  const TextStyle(color: const Color(0xFFACACAC), fontSize: 14),
                                ),
                                onChanged: (value) {
                                  controller.lNameController.text = value.trim();
                                  controller.update();
                                },
                                textDirection: controller
                                        .isRTL(controller.lNameController.text)
                                    ? TextDirection.rtl
                                    : TextDirection.ltr,

                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                              child: GestureDetector(
                                onTap: () async {
                                  print('onTap');
                                  if (!controller.isFilledAuto) {
                                    controller.phoneController.text =
                                        (await controller.autoFill.hint) ??
                                            '';
                                    controller.isFilledAuto = true;
                                    controller.update();
                                    controller.phoneController.text =
                                        controller
                                            .PhoneNumberWithoutCountryCode(
                                            controller
                                                .phoneController.text);
                                  }
                                },
                                child: InternationalPhoneNumberInput(
                                  onInputChanged: (value) {
                                    controller.theRealPhone = value;
                                    controller.prefixNumber = value.dialCode!;
                                    controller.update();
                                  },
                                  selectorTextStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.0,
                                    height: 2,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  initialValue: controller.dealCode,
                                  errorMessage: '',
                                  textFieldController:
                                  controller.phoneController,
                                  inputBorder: InputBorder.none,
                                  inputDecoration:  InputDecoration(
                                      border: const OutlineInputBorder(),
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorStyle: const TextStyle(height: 0),
                                      labelStyle:const TextStyle(color: Colors.black,fontSize: 17,height: 3),
                                      contentPadding: const EdgeInsets.only(bottom: 12,left: 8,right: 8),
                                      hintStyle:
                                      const TextStyle(color: Color(0xFFACACAC), fontSize: 14),
                                      hintText: "Phone Number".tr,
                                  ),
                                  selectorConfig: const SelectorConfig(
                                    selectorType: PhoneInputSelectorType.DIALOG,
                                    useEmoji: true,
                                  ),
                                  // maxLength: 10,
                                  validator: (val) {
                                    if (val!.length < 9) {
                                      return "";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          if (controller.phoneError != null)
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                textDirection:
                                    controller.isRTL(controller.phoneError!)
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                children: [
                                  Text(
                                    '${controller.phoneError}',
                                    textDirection:
                                        controller.isRTL(controller.phoneError!)
                                            ? TextDirection.rtl
                                            : TextDirection.ltr,
                                    style: const TextStyle(color: Colors.redAccent),
                                  ),
                                ],
                              ),
                            ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset:
                                      const Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                              child:TextFormField(
                                decoration:  InputDecoration(
                                  hintText: 'Email'.tr,
                                  label: Text('Email'.tr),
                                  border: InputBorder.none,
                                  errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                  errorStyle: const TextStyle(height: 0),
                                  labelStyle:const TextStyle(color: Colors.black),
                                  contentPadding: const EdgeInsets.only(bottom: 0,left: 8,right: 8),
                                  hintStyle:
                                  const TextStyle(color: Color(0xFFACACAC), fontSize: 14),
                                ),
                                onChanged: (value) {
                                  controller.emailController.text = value.trim();
                                  controller.update();
                                },
                                textDirection: controller
                                        .isRTL(controller.emailController.text)
                                    ? TextDirection.rtl
                                    : TextDirection.ltr,
                              ),
                            ),
                          ),
                          if (controller.emailError != null)
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                textDirection:
                                    controller.isRTL(controller.emailError!)
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                children: [
                                  Text(
                                    '${controller.emailError}',
                                    textDirection:
                                        controller.isRTL(controller.emailError!)
                                            ? TextDirection.rtl
                                            : TextDirection.ltr,
                                    style: const TextStyle(color: Colors.redAccent),
                                  ),
                                ],
                              ),
                            ),


                          GestureDetector(
                            onTap: () {
                              controller.selectMeladiDate(context);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 17),
                                child: Row(
                                  children: [
                                     Text(
                                      "Date of birth".tr,
                                      style: const TextStyle(color: Colors.grey),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          controller.age ?? 'mm-dd-yyyy',
                                          style: const TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Container(
                          //   margin: const EdgeInsets.all(10),
                          //   decoration: BoxDecoration(
                          //     color: Colors.white,
                          //     borderRadius: const BorderRadius.only(
                          //         topLeft: Radius.circular(10),
                          //         topRight: Radius.circular(10),
                          //         bottomLeft: Radius.circular(10),
                          //         bottomRight: Radius.circular(10)),
                          //     boxShadow: [
                          //       BoxShadow(
                          //         color: Colors.grey.withOpacity(0.5),
                          //         spreadRadius: 5,
                          //         blurRadius: 7,
                          //         offset:
                          //             const Offset(0, 3), // changes position of shadow
                          //       ),
                          //     ],
                          //   ),
                          //   child: Padding(
                          //     padding: const EdgeInsets.symmetric(
                          //       horizontal: 15,
                          //     ),
                          //     child: Row(
                          //       children: [
                          //         Text(
                          //           'city'.tr,
                          //           style: const TextStyle(color: Colors.grey),
                          //         ),
                          //         Expanded(
                          //           child: Padding(
                          //             padding: const EdgeInsets.symmetric(
                          //                 horizontal: 15),
                          //             child: DropdownButton<Country>(
                          //               isExpanded: true,
                          //               value: controller.selectedCountry,
                          //               underline: Container(),
                          //               items: controller.countries
                          //                   .map(
                          //                     (e) => DropdownMenuItem<Country>(
                          //                       child: Text('${e.name}'),
                          //                       value: e,
                          //                     ),
                          //                   )
                          //                   .toList(),
                          //               onChanged: (value) {
                          //                 controller.selectedCountry = value;
                          //                 controller.update();
                          //                 controller.getCity(controller.selectedCountry!.id!);
                          //                 controller.update();
                          //               },
                          //             ),
                          //           ),
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // controller.selectedCity != null?
                          // Container(
                          //   margin: const EdgeInsets.all(10),
                          //   decoration: BoxDecoration(
                          //     color: Colors.white,
                          //     borderRadius: const BorderRadius.only(
                          //         topLeft: Radius.circular(10),
                          //         topRight: Radius.circular(10),
                          //         bottomLeft: Radius.circular(10),
                          //         bottomRight: Radius.circular(10)),
                          //     boxShadow: [
                          //       BoxShadow(
                          //         color: Colors.grey.withOpacity(0.5),
                          //         spreadRadius: 5,
                          //         blurRadius: 7,
                          //         offset:
                          //             const Offset(0, 3), // changes position of shadow
                          //       ),
                          //     ],
                          //   ),
                          //   child: Padding(
                          //     padding: const EdgeInsets.symmetric(
                          //       horizontal: 15,
                          //     ),
                          //     child: Row(
                          //       children: [
                          //         Text(
                          //           'area'.tr,
                          //           style: const TextStyle(color: Colors.grey),
                          //         ),
                          //         Expanded(
                          //           child: Padding(
                          //             padding: const EdgeInsets.symmetric(
                          //                 horizontal: 15),
                          //             child: DropdownButton<City>(
                          //               isExpanded: true,
                          //               value: controller.selectedCity,
                          //               underline: Container(),
                          //               items: controller.cites
                          //                   .map(
                          //                     (e) => DropdownMenuItem<City>(
                          //                       child: Text('${e.name}'),
                          //                       value: e,
                          //                     ),
                          //                   )
                          //                   .toList(),
                          //               onChanged: (value) {
                          //                 controller.selectedCity = value;
                          //                 controller.update();
                          //               },
                          //             ),
                          //           ),
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // )
                          //     :Container(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        AppColors.blue)),
                                onPressed: () {
                                 if(firstFormKey.currentState!.validate()){
                                   controller.checkData();
                                 }
                                },
                                child:  Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 12),
                                  child: Text(
                                    "Next".tr,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  )
                  : controller.registerStep == 2
                      ? Form(
                key: secondFormKey,
                        child: Column(
                            children: [
                              const SizedBox(
                                height: 40,
                              ),
                               Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  "Car info".tr,
                                  style: const TextStyle(
                                      fontSize: 22, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                                  child: TextFormField(
                                    keyboardType: TextInputType.phone,
                                    // controller: controller.fNameController,
                                    validator: (val) {
                                      if (val!.length!=10) {
                                        return "";
                                      }
                                      return null;
                                    },
                                    textDirection: controller.isRTL(
                                            controller.driverIDController.text)
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                    onChanged: (value) {
                                      controller.driverIDController.text =
                                          value.trim();
                                      controller.update();
                                    },
                                    style: const TextStyle(color: Colors.black,height: .5),
                                    decoration:  InputDecoration(
                                      label: Text("ID number".tr),
                                      hintText: "ID number".tr,
                                      border: const OutlineInputBorder(),
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorStyle: const TextStyle(height: 0),
                                      labelStyle:const TextStyle(color: Colors.black),
                                      contentPadding: const EdgeInsets.only(bottom: 0,left: 8,right: 8),
                                      hintStyle: const TextStyle(
                                          color: const Color(0xFFACACAC), fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    // controller: controller.fNameController,
                                    textDirection: controller.isRTL(
                                            controller.driverIDController.text)
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "";
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      controller.sequenceNumber.text =
                                          value.trim();
                                      controller.update();
                                    },
                                    style: const TextStyle(color: Colors.black,height: .5),
                                    decoration:  InputDecoration(
                                      label: Text("Sequence number".tr),
                                      hintText: "Sequence number".tr,
                                      border: const OutlineInputBorder(),
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorStyle: const TextStyle(height: 0),
                                      labelStyle:const TextStyle(color: Colors.black),
                                      contentPadding: const EdgeInsets.only(bottom: 0,left: 8,right: 8),
                                      hintStyle: const TextStyle(
                                          color: Color(0xFFACACAC), fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),

                              // if(!controller.carTypeRegLoad)
                              //   Container(
                              //     margin: const EdgeInsets.all(10),
                              //     decoration: BoxDecoration(
                              //       color: Colors.white,
                              //       borderRadius: const BorderRadius.only(
                              //           topLeft: Radius.circular(10),
                              //           topRight: Radius.circular(10),
                              //           bottomLeft: Radius.circular(10),
                              //           bottomRight: Radius.circular(10)),
                              //       boxShadow: [
                              //         BoxShadow(
                              //           color: Colors.grey.withOpacity(0.5),
                              //           spreadRadius: 5,
                              //           blurRadius: 7,
                              //           offset: const Offset(
                              //               0, 3), // changes position of shadow
                              //         ),
                              //       ],
                              //     ),
                              //     child: Padding(
                              //       padding: const EdgeInsets.symmetric(
                              //         horizontal: 15,
                              //       ),
                              //       child: Row(
                              //         children: [
                              //           Text(
                              //             'نوع السيارة'.tr,
                              //             style: const TextStyle(color: Colors.grey),
                              //           ),
                              //           Expanded(
                              //             child: Padding(
                              //               padding: const EdgeInsets.symmetric(
                              //                   horizontal: 15),
                              //               child: DropdownButton<Brand>(
                              //                 isExpanded: true,
                              //                 value: controller.selectedCarBrand!,
                              //                 underline: Container(),
                              //                 items: controller.carBrands
                              //                     .map(
                              //                       (e) =>
                              //                       DropdownMenuItem<Brand>(
                              //                         child: Text('${e.name}'),
                              //                         value: e,
                              //                       ),
                              //                 )
                              //                     .toList(),
                              //                 onChanged: (value) {
                              //                   controller.selectedCarBrand = value!;
                              //                   controller.getCarModelReg(value.id);
                              //                   controller.update();
                              //                 },
                              //               ),
                              //             ),
                              //           )
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // if(!controller.carModelLoad)
                              //   Container(
                              //     margin: const EdgeInsets.all(10),
                              //     decoration: BoxDecoration(
                              //       color: Colors.white,
                              //       borderRadius: const BorderRadius.only(
                              //           topLeft: Radius.circular(10),
                              //           topRight: Radius.circular(10),
                              //           bottomLeft: Radius.circular(10),
                              //           bottomRight: Radius.circular(10)),
                              //       boxShadow: [
                              //         BoxShadow(
                              //           color: Colors.grey.withOpacity(0.5),
                              //           spreadRadius: 5,
                              //           blurRadius: 7,
                              //           offset: const Offset(
                              //               0, 3), // changes position of shadow
                              //         ),
                              //       ],
                              //     ),
                              //     child: Padding(
                              //       padding: const EdgeInsets.symmetric(
                              //         horizontal: 15,
                              //       ),
                              //       child: Row(
                              //         children: [
                              //           Text(
                              //             'موديل السيارة'.tr,
                              //             style: const TextStyle(color: Colors.grey),
                              //           ),
                              //           Expanded(
                              //             child: Padding(
                              //               padding: const EdgeInsets.symmetric(
                              //                   horizontal: 15),
                              //               child: DropdownButton<CarModel>(
                              //                 isExpanded: true,
                              //                 value: controller.selectedCarModel!,
                              //                 underline: Container(),
                              //                 items: controller.carModels
                              //                     .map(
                              //                       (e) =>
                              //                       DropdownMenuItem<CarModel>(
                              //                         child: Text('${e.carModel}'),
                              //                         value: e,
                              //                       ),
                              //                 )
                              //                     .toList(),
                              //                 onChanged: (value) {
                              //                   controller.selectedCarModel = value!;
                              //                   controller.update();
                              //                 },
                              //               ),
                              //             ),
                              //           )
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // if(!controller.carColorLoad)
                              //   Container(
                              //     margin: const EdgeInsets.all(10),
                              //     decoration: BoxDecoration(
                              //       color: Colors.white,
                              //       borderRadius: const BorderRadius.only(
                              //           topLeft: Radius.circular(10),
                              //           topRight: Radius.circular(10),
                              //           bottomLeft: Radius.circular(10),
                              //           bottomRight: Radius.circular(10)),
                              //       boxShadow: [
                              //         BoxShadow(
                              //           color: Colors.grey.withOpacity(0.5),
                              //           spreadRadius: 5,
                              //           blurRadius: 7,
                              //           offset: const Offset(
                              //               0, 3), // changes position of shadow
                              //         ),
                              //       ],
                              //     ),
                              //     child: Padding(
                              //       padding: const EdgeInsets.symmetric(
                              //         horizontal: 15,
                              //       ),
                              //       child: Row(
                              //         children: [
                              //           Text(
                              //             'لون السيارة'.tr,
                              //             style: const TextStyle(color: Colors.grey),
                              //           ),
                              //           Expanded(
                              //             child: Padding(
                              //               padding: const EdgeInsets.symmetric(
                              //                   horizontal: 15),
                              //               child: DropdownButton<CarColor>(
                              //                 isExpanded: true,
                              //                 value: controller.selectedCarColor!,
                              //                 underline: Container(),
                              //                 items: controller.carColors
                              //                     .map(
                              //                       (e) =>
                              //                       DropdownMenuItem<CarColor>(
                              //                         child: Row(
                              //                           mainAxisSize: MainAxisSize.max,
                              //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //                           children: [
                              //                             Text('${e.name}'),
                              //                             Container(
                              //                               decoration: BoxDecoration(
                              //                                   shape: BoxShape.circle,
                              //                                   border: Border.all()
                              //                               ),
                              //                               child: CircleAvatar(
                              //                                 radius: 10,
                              //                                 backgroundColor:Color(int.parse(e.code!.replaceAll('#', '0xff'))) ,
                              //                               ),
                              //                             ),
                              //                           ],
                              //                         ),
                              //                         value: e,
                              //                       ),
                              //                 )
                              //                     .toList(),
                              //                 onChanged: (value) {
                              //                   controller.selectedCarColor = value!;
                              //                   controller.update();
                              //                 },
                              //               ),
                              //             ),
                              //           )
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // Container(
                              //     margin: const EdgeInsets.all(10),
                              //     decoration: BoxDecoration(
                              //       color: Colors.white,
                              //       borderRadius: const BorderRadius.only(
                              //           topLeft: Radius.circular(10),
                              //           topRight: Radius.circular(10),
                              //           bottomLeft: Radius.circular(10),
                              //           bottomRight: Radius.circular(10)),
                              //       boxShadow: [
                              //         BoxShadow(
                              //           color: Colors.grey.withOpacity(0.5),
                              //           spreadRadius: 5,
                              //           blurRadius: 7,
                              //           offset: const Offset(
                              //               0, 3), // changes position of shadow
                              //         ),
                              //       ],
                              //     ),
                              //     child: Padding(
                              //       padding: const EdgeInsets.symmetric(
                              //         horizontal: 15,
                              //       ),
                              //       child: Row(
                              //         children: [
                              //           Text(
                              //             'سنة الصنع'.tr,
                              //             style: const TextStyle(color: Colors.grey),
                              //           ),
                              //           Expanded(
                              //             child: Padding(
                              //               padding: const EdgeInsets.symmetric(
                              //                   horizontal: 15),
                              //               child: DropdownButton<String>(
                              //                 isExpanded: true,
                              //                 value: controller.yearManufacture!,
                              //                 underline: Container(),
                              //                 items: controller.years
                              //                     .map(
                              //                       (e) =>
                              //                       DropdownMenuItem<String>(
                              //                         child: Text('${e}'),
                              //                         value: e,
                              //                       ),
                              //                 )
                              //                     .toList(),
                              //                 onChanged: (value) {
                              //                   controller.yearManufacture = value!;
                              //                   controller.update();
                              //                 },
                              //               ),
                              //             ),
                              //           )
                              //         ],
                              //       ),
                              //     ),
                              //   ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(width: .5),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset:
                                        const Offset(0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: SizedBox(
                                    height: 155,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 12),
                                          child: Column(
                                            children: [
                                              Expanded(child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                                child: Image.asset('assets/ksa_img.png',),
                                              )),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 8),
                                                child: Container(height: 1,color: Colors.black,width: 60,),
                                              ),
                                              Expanded(child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                                child: Image.asset('assets/KSA.png',),
                                              )),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                        Expanded(child: Column(
                                          children: [
                                            Expanded(child: Center(
                                                child: Text('حروف'.tr,
                                                  style: const TextStyle(
                                                      fontSize: 25,
                                                      fontWeight: FontWeight.w600
                                                  ),
                                                ))),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 8),
                                              child: Container(height: 1,color: Colors.black,),
                                            ),
                                            Expanded(child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                              child: TextFormField(
                                                validator: (val) {
                                                  if (val!.isEmpty) {
                                                    return "";
                                                  }
                                                  return null;
                                                },
                                                textDirection: controller.isRTL(controller
                                                    .plateFirstController.text)
                                                    ? TextDirection.rtl
                                                    : TextDirection.ltr,
                                                controller: controller.plateFirstController,

                                                onChanged: (value) {

                                                    controller.plateFirstController.text=value;
                                                    controller.plateFirstController.text=controller.plateFirstController.text.split(' ').join('');
                                                    controller.plateFirstController.text=controller.plateFirstController.text.split('').join(' ');
                                                    controller.plateFirstController.selection = TextSelection.fromPosition(TextPosition(offset: controller.plateFirstController.text.length));
                                                    controller.update();
                                                    print(controller.plateFirstController.text);
                                                    print("${controller.plateFirstController.text.split(' ')[2]}");
                                                    print("${controller.plateFirstController.text.split(' ')[0]}");
                                                    print("${controller.plateFirstController.text.split(' ')[1]}");


                                                },
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(5),
                                                  ],

                                                decoration:  InputDecoration(

                                                    label: Text('حروف'.tr),
                                                    hintText: 'أ ب ج',
                                                    contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 8),
                                                    border: const OutlineInputBorder(),
                                                    labelStyle: const TextStyle(color: Colors.black, letterSpacing: 10.0,),
                                                    enabledBorder: const OutlineInputBorder(),
                                                    focusedBorder: const OutlineInputBorder()

                                                ),
                                              ),
                                            )),
                                          ],
                                        )),
                                        Container(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                        Expanded(child: Column(
                                          children: [
                                            Expanded(child: Center(child:  Text('أرقام'.tr,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w600),))),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 8),
                                              child: Container(height: 1,color: Colors.black,),
                                            ),
                                            Expanded(child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                              child: TextFormField(
                                                keyboardType: TextInputType.phone,
                                                validator: (val) {
                                                  if (val!.isEmpty) {
                                                    return "";
                                                  }
                                                  return null;
                                                },
                                                textDirection: controller.isRTL(controller
                                                    .plateSecondController.text)
                                                    ? TextDirection.rtl
                                                    : TextDirection.ltr,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter.digitsOnly,
                                                  LengthLimitingTextInputFormatter(4),
                                                ],
                                                onChanged: (value) {
                                                  controller.plateSecondController.text =
                                                      value.trim();
                                                  controller.update();
                                                },
                                                decoration:  InputDecoration(
                                                    label: Text('أرقام'.tr),
                                                    contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 8),
                                                    border: const OutlineInputBorder(),
                                                    labelStyle: const TextStyle(color: Colors.black),
                                                    enabledBorder: const OutlineInputBorder(),
                                                    focusedBorder: const OutlineInputBorder()
                                                ),
                                              ),
                                            )),
                                          ],
                                        )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // Container(
                              //   margin: const EdgeInsets.all(10),
                              //   decoration: BoxDecoration(
                              //     color: Colors.white,
                              //     borderRadius: const BorderRadius.only(
                              //         topLeft: Radius.circular(10),
                              //         topRight: Radius.circular(10),
                              //         bottomLeft: Radius.circular(10),
                              //         bottomRight: Radius.circular(10)),
                              //     boxShadow: [
                              //       BoxShadow(
                              //         color: Colors.grey.withOpacity(0.5),
                              //         spreadRadius: 5,
                              //         blurRadius: 7,
                              //         offset: const Offset(
                              //             0, 3), // changes position of shadow
                              //       ),
                              //     ],
                              //   ),
                              //   child: Padding(
                              //     padding: const EdgeInsets.symmetric(
                              //       horizontal: 15,
                              //     ),
                              //     child: Row(
                              //       children: [
                              //         Text(
                              //           'carType'.tr,
                              //           style: const TextStyle(color: Colors.grey),
                              //         ),
                              //         Expanded(
                              //           child: Padding(
                              //             padding: const EdgeInsets.symmetric(
                              //                 horizontal: 15),
                              //             child: DropdownButton<CarType>(
                              //               isExpanded: true,
                              //               value: controller.selectedCarType!,
                              //               underline: Container(),
                              //               items: controller.carTypes
                              //                   .map(
                              //                     (e) =>
                              //                         DropdownMenuItem<CarType>(
                              //                       child: Text('${e.nameAr}'),
                              //                       value: e,
                              //                     ),
                              //                   )
                              //                   .toList(),
                              //               onChanged: (value) {
                              //                 controller.selectedCarType = value!;
                              //                 controller.update();
                              //               },
                              //             ),
                              //           ),
                              //         )
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              ////////////
                              GestureDetector(
                                onTap: () {
                                  controller.pickDriverLicenseFront();
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: TextFormField(
                                      // controller: controller.fNameController,
                                      textDirection: controller.isRTL(controller
                                              .yearManufactureController.text)
                                          ? TextDirection.rtl
                                          : TextDirection.ltr,
                                      enabled: false,
                                      onChanged: (value) {
                                        controller.yearManufactureController
                                            .text = value.trim();
                                        controller.update();
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Driving license from front'.tr,
                                        border: InputBorder.none,
                                        suffixIcon: controller
                                                    .drivingLicenseFromFront !=
                                                null
                                            ? Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children:  [
                                                  Text('edit'.tr),
                                                  const Icon(
                                                    Icons.check,
                                                    color: Colors.green,
                                                  ),
                                                ],
                                              )
                                            : const Icon(Icons.add),
                                        hintStyle: const TextStyle(
                                            color: Color(0xFFACACAC),
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (controller.drivingLicenseFromFront != null)
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.width * 0.4,
                                    decoration: BoxDecoration(
                                        color: AppColors.blue,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        image:
                                            controller.drivingLicenseFromFront !=
                                                    null
                                                ? DecorationImage(
                                                    image: FileImage(controller
                                                        .drivingLicenseFromFront!),
                                                    fit: BoxFit.cover,
                                                  )
                                                : const DecorationImage(
                                                    image: AssetImage(
                                                        'assets/ProfilePicture.png'),
                                                    fit: BoxFit.cover,
                                                  )),
                                  ),
                                ),
                              ///////////
                              GestureDetector(
                                onTap: () {
                                  controller.pickDriverLicenseBack();
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: TextFormField(
                                      // controller: controller.fNameController,
                                      textDirection: controller.isRTL(controller
                                              .yearManufactureController.text)
                                          ? TextDirection.rtl
                                          : TextDirection.ltr,
                                      enabled: false,
                                      onChanged: (value) {
                                        controller.yearManufactureController
                                            .text = value.trim();
                                        controller.update();
                                      },
                                      decoration: InputDecoration(
                                        hintText:
                                            'driving license from behind'.tr,
                                        border: InputBorder.none,
                                        suffixIcon: controller
                                                    .drivingLicenseFromBehindImage !=
                                                null
                                            ? Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children:  [
                                                  Text('edit'.tr),
                                                  const Icon(
                                                    Icons.check,
                                                    color: Colors.green,
                                                  ),
                                                ],
                                              )
                                            : const Icon(Icons.add),
                                        hintStyle: const TextStyle(
                                            color: Color(0xFFACACAC),
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (controller.drivingLicenseFromBehindImage !=
                                  null)
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.width * 0.4,
                                    decoration: BoxDecoration(
                                        color: AppColors.blue,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        image: controller
                                                    .drivingLicenseFromBehindImage !=
                                                null
                                            ? DecorationImage(
                                                image: FileImage(controller
                                                    .drivingLicenseFromBehindImage!),
                                                fit: BoxFit.cover,
                                              )
                                            : const DecorationImage(
                                                image: AssetImage(
                                                    'assets/ProfilePicture.png'),
                                                fit: BoxFit.cover,
                                              )),
                                  ),
                                ),
                              //////////////
                              GestureDetector(
                                onTap: () {
                                  controller.pickNotSentenced();
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: TextFormField(
                                      // controller: controller.fNameController,
                                      textDirection: controller.isRTL(controller
                                              .yearManufactureController.text)
                                          ? TextDirection.rtl
                                          : TextDirection.ltr,
                                      enabled: false,
                                      onChanged: (value) {
                                        controller.yearManufactureController
                                            .text = value.trim();
                                        controller.update();
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'not_sentenced'.tr,
                                        border: InputBorder.none,
                                        suffixIcon:
                                            controller.notSentencedImage != null
                                                ? Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children:  [
                                                      Text('edit'.tr),
                                                      const Icon(
                                                        Icons.check,
                                                        color: Colors.green,
                                                      ),
                                                    ],
                                                  )
                                                : const Icon(Icons.add),
                                        hintStyle: const TextStyle(
                                            color: Color(0xFFACACAC),
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (controller.notSentencedImage != null)
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.width * 0.4,
                                    decoration: BoxDecoration(
                                        color: AppColors.blue,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        image:
                                            controller.notSentencedImage != null
                                                ? DecorationImage(
                                                    image: FileImage(controller
                                                        .notSentencedImage!),
                                                    fit: BoxFit.cover,
                                                  )
                                                : const DecorationImage(
                                                    image: AssetImage(
                                                        'assets/ProfilePicture.png'),
                                                    fit: BoxFit.cover,
                                                  )),
                                  ),
                                ),
                              //////////////
                              GestureDetector(
                                onTap: () {
                                  controller.pickMedicalExamination();
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: TextFormField(
                                      // controller: controller.fNameController,
                                      textDirection: controller.isRTL(controller
                                              .yearManufactureController.text)
                                          ? TextDirection.rtl
                                          : TextDirection.ltr,
                                      enabled: false,
                                      onChanged: (value) {
                                        controller.yearManufactureController
                                            .text = value.trim();
                                        controller.update();
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Medical examination'.tr,
                                        border: InputBorder.none,
                                        suffixIcon: controller
                                                    .medicalExaminationImage !=
                                                null
                                            ? Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children:  [
                                                  Text('edit'.tr),
                                                  const Icon(
                                                    Icons.check,
                                                    color: Colors.green,
                                                  ),
                                                ],
                                              )
                                            : const Icon(Icons.add),
                                        hintStyle: const TextStyle(
                                            color: Color(0xFFACACAC),
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (controller.medicalExaminationImage != null)
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.width * 0.4,
                                    decoration: BoxDecoration(
                                        color: AppColors.blue,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        image:
                                            controller.medicalExaminationImage !=
                                                    null
                                                ? DecorationImage(
                                                    image: FileImage(controller
                                                        .medicalExaminationImage!),
                                                    fit: BoxFit.cover,
                                                  )
                                                : const DecorationImage(
                                                    image: AssetImage(
                                                        'assets/ProfilePicture.png'),
                                                    fit: BoxFit.cover,
                                                  )),
                                  ),
                                ),
                              //////////////
                              GestureDetector(
                                onTap: () {
                                  controller.pickLicensePlate();
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: TextFormField(
                                      // controller: controller.fNameController,
                                      textDirection: controller.isRTL(controller
                                              .yearManufactureController.text)
                                          ? TextDirection.rtl
                                          : TextDirection.ltr,
                                      enabled: false,
                                      onChanged: (value) {
                                        controller.yearManufactureController
                                            .text = value.trim();
                                        controller.update();
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'License plate'.tr,
                                        border: InputBorder.none,
                                        suffixIcon:
                                            controller.licensePlateImage != null
                                                ? Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children:  [
                                                      Text('edit'.tr),
                                                      const Icon(
                                                        Icons.check,
                                                        color: Colors.green,
                                                      ),
                                                    ],
                                                  )
                                                : const Icon(Icons.add),
                                        hintStyle: const TextStyle(
                                            color: Color(0xFFACACAC),
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (controller.licensePlateImage != null)
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.width * 0.4,
                                    decoration: BoxDecoration(
                                        color: AppColors.blue,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        image:
                                            controller.licensePlateImage != null
                                                ? DecorationImage(
                                                    image: FileImage(controller
                                                        .licensePlateImage!),
                                                    fit: BoxFit.cover,
                                                  )
                                                : const DecorationImage(
                                                    image: AssetImage(
                                                        'assets/ProfilePicture.png'),
                                                    fit: BoxFit.cover,
                                                  )),
                                  ),
                                ),
                              //////////////
                              GestureDetector(
                                onTap: () {
                                  controller.pickCarInsurance();
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: TextFormField(
                                      // controller: controller.fNameController,
                                      textDirection: controller.isRTL(controller
                                              .yearManufactureController.text)
                                          ? TextDirection.rtl
                                          : TextDirection.ltr,
                                      enabled: false,
                                      onChanged: (value) {
                                        controller.yearManufactureController
                                            .text = value.trim();
                                        controller.update();
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Car insurance'.tr,
                                        border: InputBorder.none,
                                        suffixIcon:
                                            controller.carInsuranceImage != null
                                                ? Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children:  [
                                                      Text('edit'.tr),
                                                      const Icon(
                                                        Icons.check,
                                                        color: Colors.green,
                                                      ),
                                                    ],
                                                  )
                                                : const Icon(Icons.add),
                                        hintStyle: const TextStyle(
                                            color: Color(0xFFACACAC),
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (controller.carInsuranceImage != null)
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.width * 0.4,
                                    decoration: BoxDecoration(
                                        color: AppColors.blue,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        image:
                                            controller.carInsuranceImage != null
                                                ? DecorationImage(
                                                    image: FileImage(controller
                                                        .carInsuranceImage!),
                                                    fit: BoxFit.cover,
                                                  )
                                                : const DecorationImage(
                                                    image: AssetImage(
                                                        'assets/ProfilePicture.png'),
                                                    fit: BoxFit.cover,
                                                  )),
                                  ),
                                ),
                              //////////////
                              GestureDetector(
                                onTap: () {
                                  controller.pickDrivingLicense();
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: TextFormField(
                                      // controller: controller.fNameController,
                                      textDirection: controller.isRTL(controller
                                              .yearManufactureController.text)
                                          ? TextDirection.rtl
                                          : TextDirection.ltr,
                                      enabled: false,
                                      onChanged: (value) {
                                        controller.yearManufactureController
                                            .text = value.trim();
                                        controller.update();
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Driving license'.tr,
                                        border: InputBorder.none,
                                        suffixIcon:
                                            controller.drivingLicenseImage != null
                                                ? Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children:  [
                                                      Text('edit'.tr),
                                                      const Icon(
                                                        Icons.check,
                                                        color: Colors.green,
                                                      ),
                                                    ],
                                                  )
                                                : const Icon(Icons.add),
                                        hintStyle: const TextStyle(
                                            color: Color(0xFFACACAC),
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (controller.drivingLicenseImage != null)
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.width * 0.4,
                                    decoration: BoxDecoration(
                                        color: AppColors.blue,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        image:
                                            controller.drivingLicenseImage != null
                                                ? DecorationImage(
                                                    image: FileImage(controller
                                                        .drivingLicenseImage!),
                                                    fit: BoxFit.cover,
                                                  )
                                                : const DecorationImage(
                                                    image: AssetImage(
                                                        'assets/ProfilePicture.png'),
                                                    fit: BoxFit.cover,
                                                  )),
                                  ),
                                ),
                              ////////////
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Checkbox(
                                          fillColor: MaterialStateProperty.all(
                                              AppColors.blue),
                                          value: controller.acceptedTerms,
                                          onChanged: (var v) {
                                            controller.acceptedTerms = v!;
                                            controller.update();
                                          }),
                                    ),
                                    Expanded(
                                        flex: 9,
                                        child: GestureDetector(
                                          onTap: () {
                                            // launch('https://.com/en/portal/terms/ar');
                                          },
                                          child:  Text(
                                            'accept_terms'.tr,
                                            textAlign: TextAlign.justify,
                                            style: const TextStyle(
                                              decoration: TextDecoration.underline,
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                AppColors.blue)),
                                    onPressed: () {
                                     if(secondFormKey.currentState!.validate()){
                                       Get.to(()=>LoginScreen());
                                       QuickAlert.show(
                                         context: context,
                                         type: QuickAlertType.info,
                                         confirmBtnColor: AppColors.blue,
                                         text: 'Your request has been sent successfully, we will inform you once it\'s confirmed'.tr,
                                       );
                                       // controller.registerDriver();
                                     }
                                    },
                                    child:  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 12),
                                      child: Text(
                                        "Register".tr,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                      )
                      : Column(),
            ),
          ),
        ),
      ),
    );
  }

}
