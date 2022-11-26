import 'package:driver_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:get/get.dart';

import '../../helper/helper.dart';
import '../../viewmodel/payment_viewmodel.dart';


class AddCreditCardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddCreditCardPageState();
  }
}

class AddCreditCardPageState extends State<AddCreditCardPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  String? cardType;
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  CreditCardValidator _ccValidator = CreditCardValidator();

  bool validateCreditCardInfo(
      String ccNum,
      String expDate,
      String cvv,
      ) {
    var ccNumResults = _ccValidator.validateCCNum(ccNum);
    // var expDateResults = _ccValidator.validateExpDate(expDate);
    // var cvvResults = _ccValidator.validateCVV(cvv, ccNumResults.ccType);
    if (ccNumResults.isPotentiallyValid) {
      // Call UI code that shows to the user their credit card number is invalid
      // displayInvalidCardNumber();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentViewModel>(
        init: PaymentViewModel(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                centerTitle: true,
                title:   Text(
                  "Add new card".tr,
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
              body: SafeArea(
                child: Column(
                  children: <Widget>[
                    Directionality(
                      textDirection: Get.locale?.languageCode == "ar"?TextDirection.rtl:TextDirection.ltr,
                      child: Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: CreditCardWidget(
                                    glassmorphismConfig:
                                    useGlassMorphism ? Glassmorphism.defaultConfig() : null,
                                    cardNumber: cardNumber,
                                    expiryDate: expiryDate,
                                    cardHolderName: cardHolderName,
                                    cvvCode: cvvCode,
                                    showBackView: isCvvFocused,
                                    obscureCardNumber: true,
                                    obscureCardCvv: true,
                                    isHolderNameVisible: true,
                                    textStyle: const TextStyle(color: AppColors.cyan),
                                    cardBgColor: AppColors.containerColor,
                                    backgroundImage:'assets/card_bg.png' ,
                                    isSwipeGestureEnabled: true,
                                    onCreditCardWidgetChange:
                                        (CreditCardBrand creditCardBrand) {
                                      print('creditCardBrand: ${creditCardBrand.brandName!.name}');
                                      cardType=creditCardBrand.brandName!.name;
                                    },
                                    customCardTypeIcons: <CustomCardTypeIcon>[
                                      CustomCardTypeIcon(
                                        cardType: CardType.mastercard,
                                        cardImage: Image.asset(
                                          'assets/mastercard.png',
                                          height: 48,
                                          width: 48,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: CreditCardForm(
                                    formKey: formKey,
                                    obscureCvv: true,
                                    obscureNumber: false,
                                    cardNumber: cardNumber,
                                    cvvCode: cvvCode,
                                    isHolderNameVisible: true,
                                    isCardNumberVisible: true,
                                    isExpiryDateVisible: true,
                                    cardHolderName: cardHolderName,
                                    expiryDate: expiryDate,
                                    themeColor: Colors.blue,
                                    textColor: Colors.black,
                                    cardNumberDecoration: InputDecoration(
                                      labelText: 'number'.tr,
                                      hintText: 'XXXX XXXX XXXX XXXX',
                                      contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                      hintStyle:
                                      const TextStyle(color: AppColors.blue),
                                      labelStyle:
                                      const TextStyle(color: AppColors.blue),
                                      focusedBorder: border,
                                      enabledBorder: border,
                                    ),
                                    expiryDateDecoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                      hintStyle:
                                      const TextStyle(color: AppColors.blue),
                                      labelStyle:
                                      const TextStyle(color: AppColors.blue),
                                      focusedBorder: border,
                                      enabledBorder: border,
                                      labelText: "expired date".tr,
                                      hintText: 'mm/yy',
                                    ),
                                    cvvCodeDecoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                      hintStyle:
                                      const TextStyle(color: AppColors.blue),
                                      labelStyle:
                                      const TextStyle(color: AppColors.blue),
                                      focusedBorder: border,
                                      enabledBorder: border,
                                      labelText: 'cvv'.tr,
                                      hintText: 'XXX',
                                    ),
                                    cardHolderDecoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                      hintStyle:
                                      const TextStyle(color: AppColors.blue),
                                      labelStyle:
                                      const TextStyle(color: AppColors.blue),
                                      focusedBorder: border,
                                      enabledBorder: border,
                                      labelText: "card holder name".tr,
                                    ),
                                    onCreditCardModelChange: onCreditCardModelChange,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: <Widget>[
                                //     const Text(
                                //       'Glassmorphism',
                                //       style: TextStyle(
                                //         color: Colors.white,
                                //         fontSize: 18,
                                //       ),
                                //     ),
                                //     Switch(
                                //       value: useGlassMorphism,
                                //       inactiveTrackColor: Colors.grey,
                                //       activeColor: Colors.white,
                                //       activeTrackColor: Colors.green,
                                //       onChanged: (bool value) => setState(() {
                                //         useGlassMorphism = value;
                                //       }),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: <Widget>[
                                //     const Text(
                                //       'Card Image',
                                //       style: TextStyle(
                                //         color: Colors.white,
                                //         fontSize: 18,
                                //       ),
                                //     ),
                                //     Switch(
                                //       value: useBackgroundImage,
                                //       inactiveTrackColor: Colors.grey,
                                //       activeColor: Colors.white,
                                //       activeTrackColor: Colors.green,
                                //       onChanged: (bool value) => setState(() {
                                //         useBackgroundImage = value;
                                //       }),
                                //     ),
                                //   ],
                                // ),

                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    primary: AppColors.blue,
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(vertical: 7,horizontal: 20),
                                    child: Text(
                                      'check'.tr,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      if (validateCreditCardInfo(
                                          cardNumber, expiryDate, cvvCode)) {
                                        print('valid!');
                                        controller.isNoPayment = true;
                                        controller.update();
                                        Get.back();
                                      } else {
                                        print('hbnm');
                                        Helper().showError(
                                          "invalid card".tr,
                                          "Invalid Credit card info".tr,
                                        );
                                      }
                                    } else {
                                      print('invalid!');
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        }
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
