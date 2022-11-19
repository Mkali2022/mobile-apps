import 'dart:convert';
import 'dart:developer';
import 'dart:io';


import 'package:driver_app/utils/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:hijri_picker/hijri_picker.dart';
import 'package:image_picker/image_picker.dart';

import 'package:intl/intl.dart' as intl;

import 'package:http/http.dart' as http;


import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../helper/helper.dart';


class RegisterViewModel extends GetxController with CodeAutoFill {
  File? driverImage;

  File? drivingLicenseFromFront;
  File? drivingLicenseFromBehindImage;
  File? notSentencedImage;
  File? medicalExaminationImage;
  File? licensePlateImage;
  File? carInsuranceImage;
  File? drivingLicenseImage;
  String? age;
  bool isVerify = false;

  late PhoneNumber theRealPhone;
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController plateFirstController = TextEditingController();
  String plll = '';
  final TextEditingController plateSecondController = TextEditingController();

  final TextEditingController driverIDController = TextEditingController();
  final TextEditingController sequenceNumber = TextEditingController();
  final TextEditingController vehiclePlateController = TextEditingController();
  final TextEditingController yearManufactureController =
      TextEditingController();
  String? yearManufacture;

  String? phoneError;
  String? emailError;
  bool info = true;
  // List<CarType> carTypes = [];
  // CarType? selectedCarType;
  // List<Brand> carBrands = [];
  // CarColor? selectedCarColor;
  // List<CarColor> carColors = [];
  // Brand? selectedCarBrand;
  // List<CarModel> carModels = [];
  // CountryModel? countryModel;
  // List<Country> countries = [];
  // Country? selectedCountry;
  // CarModel? selectedCarModel;
  bool carTypeLoad = false;
  bool carTypeRegLoad = false;
  bool carModelLoad = false;
  bool carColorLoad = false;
  bool carYearLoad = false;
  // List<City> cites = [];
  // City? selectedCity;
  int registerStep = 1;
  String prefixNumber = '+966';
  PhoneNumber dealCode = PhoneNumber(isoCode: 'SA');
  bool isFilledAuto = false;
  final SmsAutoFill autoFill = SmsAutoFill();
  String? phoneLogin;
  String? prefix;
  String? deal;
  bool acceptedTerms = false;

  RegisterViewModel(this.phoneLogin, this.prefix, this.deal);

  List dateType = ["هجري", "ميلادي"];
  String? answer = 'هجري';

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio<String>(
          activeColor: Theme.of(Get.context!).primaryColor,
          value: dateType[btnValue],
          groupValue: answer,
          onChanged: (value) {
            print(value);
            answer = value;
            if (answer == 'هجري') {
              isHijri = true;
            } else {
              isHijri = false;
            }
            update();
          },
        ),
        Text(title)
      ],
    );
  }

  @override
  void onInit() {
    listenForCode();
    registerStep = 1;
    print('mdvjnk  ${prefix}');
    if (prefix != null) {
      theRealPhone = PhoneNumber(
          dialCode: prefix!, phoneNumber: phoneLogin!, isoCode: deal!);
      dealCode = PhoneNumber(
          dialCode: prefix!, phoneNumber: phoneLogin!, isoCode: deal!);
      prefixNumber = prefix!;
      phoneController.text = phoneLogin!;
      update();
    }
    getYears();
    // getCountries();
    // getCarType();
    // getCarColorReg();
    update();
    // getCarTypeReg();
    super.onInit();
  }

  List<String> years = [];

  @override
  void codeUpdated() {
    smsController.text = code!;
    logMessage('GetOtp: $code');
    isVerify = true;
    verifiedNumber = (prefixNumber + phoneController.text).replaceAll(' ', '');
    registerStep=2;
    update();
  }

  getYears() async {
    carYearLoad = true;
    years = [];
    update();
    for (int i = DateTime.now().year; i >= DateTime.now().year - 40; i--) {
      years.add(i.toString());
    }
    yearManufacture = years.first;
    update();
    carYearLoad = false;
    update();
  }

  bool isHijri = true;
  var selectedDate =  HijriCalendar.now();

  Future<Null> selectHijriDate(BuildContext context) async {
    final HijriCalendar? picked = await showHijriDatePicker(
      context: context,
      initialDate: selectedDate,
      lastDate: new HijriCalendar()
        ..hYear = 1445
        ..hMonth = 9
        ..hDay = 25,
      firstDate: new HijriCalendar()
        ..hYear = 1371
        ..hMonth = 1
        ..hDay = 1,
      initialDatePickerMode: DatePickerMode.day,
    );
    if (picked != null) {
      selectedDate = picked;
      print(
          '${selectedDate.hDay}-${selectedDate.hMonth}-${selectedDate.hYear}');
      age = '${selectedDate.hDay}-${selectedDate.hMonth}-${selectedDate.hYear}';
    }
    update();
  }

  Future<Null> selectMeladiDate(BuildContext context) async {
    showDialog<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime(2022, 1, 1),
          firstDate: DateTime(1950, 1, 1),
          lastDate: DateTime.now(),
        );
      },
    ).then((value) {
      print('${value!.day}-${value.month}-${value.year}');
      age = '${value.day}-${value.month}-${value.year}';
      update();
    });
  }

  String PhoneNumberWithoutCountryCode(String phoneNumberWithCountryCode) {
    RegExp regExp = RegExp(
        "\\+(?:998|996|995|994|993|992|977|976|975|974|973|972|971|970|968|967|966|965|964|963|962|961|960|886|880|856|855|853|852|850|692|691|690|689|688|687|686|685|683|682|681|680|679|678|677|676|675|674|673|672|670|599|598|597|595|593|592|591|590|509|508|507|506|505|504|503|502|501|500|423|421|420|389|387|386|385|383|382|381|380|379|378|377|376|375|374|373|372|371|370|359|358|357|356|355|354|353|352|351|350|299|298|297|291|290|269|268|267|266|265|264|263|262|261|260|258|257|256|255|254|253|252|251|250|249|248|246|245|244|243|242|241|240|239|238|237|236|235|234|233|232|231|230|229|228|227|226|225|224|223|222|221|220|218|216|213|212|211|98|95|94|93|92|91|90|86|84|82|81|66|65|64|63|62|61|60|58|57|56|55|54|53|52|51|49|48|47|46|45|44\\D?1624|44\\D?1534|44\\D?1481|44|43|41|40|39|36|34|33|32|31|30|27|20|7|1\\D?939|1\\D?876|1\\D?869|1\\D?868|1\\D?849|1\\D?829|1\\D?809|1\\D?787|1\\D?784|1\\D?767|1\\D?758|1\\D?721|1\\D?684|1\\D?671|1\\D?670|1\\D?664|1\\D?649|1\\D?473|1\\D?441|1\\D?345|1\\D?340|1\\D?284|1\\D?268|1\\D?264|1\\D?246|1\\D?242|1)\\D?");

    final newString =
        phoneNumberWithCountryCode.replaceAllMapped(regExp, (match) {
      dealCode = PhoneNumber(
          isoCode: PhoneNumber.getISO2CodeByPrefix('${match.group(0)}'));
      prefixNumber = '${match.group(0)}';
      print('NEWREGEX ${dealCode.phoneNumber}');
      update();
      return '';
    });

    return newString;
  }

  pickDriverImage() async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      driverImage = File(image.path);
    }
    update();
  }

  pickDriverLicenseFront() {
    final ImagePicker _imagePicker = ImagePicker();
    final action = CupertinoActionSheet(
      message: const Text(
        'Add profile picture',
        style: TextStyle(fontSize: 15.0),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          isDefaultAction: false,
          onPressed: () async {
            Get.back();
            XFile? image =
                await _imagePicker.pickImage(source: ImageSource.gallery);
            if (image != null) {
              drivingLicenseFromFront = File(image.path);
            }
            update();
          },
          child: const Text('Choose from gallery'),
        ),
        CupertinoActionSheetAction(
          isDestructiveAction: false,
          onPressed: () async {
            Get.back();
            XFile? image =
                await _imagePicker.pickImage(source: ImageSource.camera);
            if (image != null) {
              drivingLicenseFromFront = File(image.path);
            }
            update();
          },
          child: const Text('Take a picture'),
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        child: const Text('Cancel'),
        onPressed: () {
          Get.back();
        },
      ),
    );
    showCupertinoModalPopup(
        context: Get.context!, builder: (context) => action);
  }

  pickDriverLicenseBack() {
    final ImagePicker _imagePicker = ImagePicker();
    final action = CupertinoActionSheet(
      message: const Text(
        'Add profile picture',
        style: TextStyle(fontSize: 15.0),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          isDefaultAction: false,
          onPressed: () async {
            Get.back();
            XFile? image =
                await _imagePicker.pickImage(source: ImageSource.gallery);
            if (image != null) {
              drivingLicenseFromBehindImage = File(image.path);
            }
            update();
          },
          child: const Text('Choose from gallery'),
        ),
        CupertinoActionSheetAction(
          isDestructiveAction: false,
          onPressed: () async {
            Get.back();
            XFile? image =
                await _imagePicker.pickImage(source: ImageSource.camera);
            if (image != null) {
              drivingLicenseFromBehindImage = File(image.path);
            }
            update();
          },
          child: const Text('Take a picture'),
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        child: const Text('Cancel'),
        onPressed: () {
          Get.back();
        },
      ),
    );
    showCupertinoModalPopup(
        context: Get.context!, builder: (context) => action);
  }

  pickNotSentenced() {
    final ImagePicker _imagePicker = ImagePicker();
    final action = CupertinoActionSheet(
      message: const Text(
        'Add profile picture',
        style: TextStyle(fontSize: 15.0),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          isDefaultAction: false,
          onPressed: () async {
            Get.back();
            XFile? image =
                await _imagePicker.pickImage(source: ImageSource.gallery);
            if (image != null) {
              notSentencedImage = File(image.path);
            }
            update();
          },
          child: const Text('Choose from gallery'),
        ),
        CupertinoActionSheetAction(
          isDestructiveAction: false,
          onPressed: () async {
            Get.back();
            XFile? image =
                await _imagePicker.pickImage(source: ImageSource.camera);
            if (image != null) {
              notSentencedImage = File(image.path);
            }
            update();
          },
          child: const Text('Take a picture'),
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        child: const Text('Cancel'),
        onPressed: () {
          Get.back();
        },
      ),
    );
    showCupertinoModalPopup(
        context: Get.context!, builder: (context) => action);
  }

  pickMedicalExamination() {
    final ImagePicker _imagePicker = ImagePicker();
    final action = CupertinoActionSheet(
      message: const Text(
        'Add profile picture',
        style: TextStyle(fontSize: 15.0),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          isDefaultAction: false,
          onPressed: () async {
            Get.back();
            XFile? image =
                await _imagePicker.pickImage(source: ImageSource.gallery);
            if (image != null) {
              medicalExaminationImage = File(image.path);
            }
            update();
          },
          child: const Text('Choose from gallery'),
        ),
        CupertinoActionSheetAction(
          isDestructiveAction: false,
          onPressed: () async {
            Get.back();
            XFile? image =
                await _imagePicker.pickImage(source: ImageSource.camera);
            if (image != null) {
              medicalExaminationImage = File(image.path);
            }
            update();
          },
          child: const Text('Take a picture'),
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        child: const Text('Cancel'),
        onPressed: () {
          Get.back();
        },
      ),
    );
    showCupertinoModalPopup(
        context: Get.context!, builder: (context) => action);
  }

  pickLicensePlate() {
    final ImagePicker _imagePicker = ImagePicker();
    final action = CupertinoActionSheet(
      message: const Text(
        'Add profile picture',
        style: TextStyle(fontSize: 15.0),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          isDefaultAction: false,
          onPressed: () async {
            Get.back();
            XFile? image =
                await _imagePicker.pickImage(source: ImageSource.gallery);
            if (image != null) {
              licensePlateImage = File(image.path);
            }
            update();
          },
          child: const Text('Choose from gallery'),
        ),
        CupertinoActionSheetAction(
          isDestructiveAction: false,
          onPressed: () async {
            Get.back();
            XFile? image =
                await _imagePicker.pickImage(source: ImageSource.camera);
            if (image != null) {
              licensePlateImage = File(image.path);
            }
            update();
          },
          child: const Text('Take a picture'),
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        child: const Text('Cancel'),
        onPressed: () {
          Get.back();
        },
      ),
    );
    showCupertinoModalPopup(
        context: Get.context!, builder: (context) => action);
  }

  pickCarInsurance() {
    final ImagePicker _imagePicker = ImagePicker();
    final action = CupertinoActionSheet(
      message: const Text(
        'Add profile picture',
        style: TextStyle(fontSize: 15.0),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          isDefaultAction: false,
          onPressed: () async {
            Get.back();
            XFile? image =
                await _imagePicker.pickImage(source: ImageSource.gallery);
            if (image != null) {
              carInsuranceImage = File(image.path);
            }
            update();
          },
          child: const Text('Choose from gallery'),
        ),
        CupertinoActionSheetAction(
          isDestructiveAction: false,
          onPressed: () async {
            Get.back();
            XFile? image =
                await _imagePicker.pickImage(source: ImageSource.camera);
            if (image != null) {
              carInsuranceImage = File(image.path);
            }
            update();
          },
          child: const Text('Take a picture'),
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        child: const Text('Cancel'),
        onPressed: () {
          Get.back();
        },
      ),
    );
    showCupertinoModalPopup(
        context: Get.context!, builder: (context) => action);
  }

  pickDrivingLicense() {
    final ImagePicker _imagePicker = ImagePicker();
    final action = CupertinoActionSheet(
      message: const Text(
        'Add profile picture',
        style: TextStyle(fontSize: 15.0),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          isDefaultAction: false,
          onPressed: () async {
            Get.back();
            XFile? image =
                await _imagePicker.pickImage(source: ImageSource.gallery);
            if (image != null) {
              drivingLicenseImage = File(image.path);
            }
            update();
          },
          child: const Text('Choose from gallery'),
        ),
        CupertinoActionSheetAction(
          isDestructiveAction: false,
          onPressed: () async {
            Get.back();
            XFile? image =
                await _imagePicker.pickImage(source: ImageSource.camera);
            if (image != null) {
              drivingLicenseImage = File(image.path);
            }
            update();
          },
          child: const Text('Take a picture'),
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        child: const Text('Cancel'),
        onPressed: () {
          Get.back();
        },
      ),
    );
    showCupertinoModalPopup(
        context: Get.context!, builder: (context) => action);
  }

  // final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  checkData() {
    if (isVerify &&
        verifiedNumber ==
            (prefixNumber + phoneController.text).replaceAll(' ', '')) {
      if (age != null &&
          fNameController.text.isNotEmpty &&
          lNameController.text.isNotEmpty &&
          phoneController.text.isNotEmpty) {
        // Helper().loading();
        // var body = {
        //   'phone_number':
        //       '$prefixNumber${phoneController.text.replaceAll(' ', '')}',
        // };
        // APIRequest()
        //     .multiPartMethodRequest(ApiUrls.driverCheck, {}, body, null)
        //     .then((value) {
        //   if (value.toString() != '[]')
        //     if (value == null ||
        //       Map.from(value).isEmpty) {
        //       print('WHAT1');
        //     emailError = null;
        //     phoneError = null;
        //     update();
        //     info = false;
        //     Get.back();
        //     registerStep = 2;
        //     update();
        //     print({
        //       'firstname': '${fNameController.text}',
        //       'lastname': '${lNameController.text}',
        //       'email': '${emailController.text}',
        //       'age': '$age',
        //       'gender': 'female',
        //       'phone_number': '${phoneController.text.replaceAll(' ', '')}',
        //       'city': '${selectedCity!.name}',
        //     });
        //   }
        //   else {
        //       print('WHAT2');
        //     Get.back();
        //     emailError = value?['email'] != null
        //         ? 'البريد الإلكتروني مستخدم من قبل'
        //         : null;
        //     phoneError = value?['phone_number'] != null
        //         ? 'رقم الهاتف مستخدم من قبل'
        //         : null;
        //     Helper().showError('حدث خطأ',
        //         '${phoneError != null ? 'رقم الهاتف مستخدم من قبل' : ''}${phoneError != null && emailError != null ? '\n' : ''}${emailError != null ? 'البريد الإلكتروني مستخدم من قبل' : ''}');
        //
        //     update();
        //   }
        //   else {
        //     emailError = null;
        //     phoneError = null;
        //     update();
        //     info = false;
        //     Get.back();
            registerStep = 2;


            update();
        //     print({
        //       'firstname': '${fNameController.text}',
        //       'lastname': '${lNameController.text}',
        //       'email': '${emailController.text}',
        //       'age': '$age',
        //       'gender': 'female',
        //       'phone_number': '${phoneController.text.replaceAll(' ', '')}',
        //       'city': '${selectedCity!.name}',
        //     });
        //   }
        // });
      } else {
        Get.back();
        Helper().showError('تعبئة البيانات', 'يرجى اختيار العمر');
      }
    } else {
      smsController.clear();

      Get.dialog(AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        content: Container(
          width: Get.width * .001,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                "Enter the code in the text message".tr,
              ),
              const SizedBox(
                height: 12,
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: PinPut(
                    pinAnimationType: PinAnimationType.rotation,
                    fieldsCount: 6,
                    autofocus: true,
                    onSubmit: (String pin) async{
                      print('PIN $pin');
                      signInWithPhoneNumber().then((value) {
                        Get.back();
                        if(value){
                          update();
                          Get.back();
                          // Helper().showHint('التحقق من الهاتف', 'تم التحقق من رقم الهاتف ');
                        }else{
                          Helper().showError('التحقق من الهاتف', 'فشل التحقق من رقم الهاتف ');
                        }
                      });
                    },
                    focusNode: _pinPutFocusNode,
                    preFilledWidget: Container(
                      width: Get.height * 0.02,
                      height: Get.height * 0.02,
                      decoration: BoxDecoration(
                          color: Colors.grey[700], shape: BoxShape.circle),
                    ),
                    controller: smsController,
                    submittedFieldDecoration: _pinPutDecoration,
                    textStyle: const TextStyle(fontSize: 20),
                    selectedFieldDecoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 3.0,
                        ),
                      ),
                    ),
                    followingFieldDecoration: _pinPutDecoration,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: buttonLogIn(
                    context: Get.context!,
                    text: "Next".tr,
                    function: () async{
                      signInWithPhoneNumber().then((value) {
                        Get.back();
                        if(value){
                          update();
                          Get.back();
                          // Helper().showHint('التحقق من الهاتف', 'تم التحقق من رقم الهاتف ');
                        }else{
                          update();
                          Helper().showError('التحقق من الهاتف', 'فشل التحقق من رقم الهاتف ');
                        }
                      });
                    }),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ));

      verifyPhoneNumber(
          (prefixNumber + phoneController.text).replaceAll(' ', ''));
    }
  }

  BoxDecoration get _pinPutDecoration {
    return const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          //                   <--- left side
          color: Colors.black,
          width: 3.0,
        ),
      ),
    );
  }

  // registerDriver() async {
  //   if (driverIDController.text.isNotEmpty &&
  //       plateFirstController.text.isNotEmpty &&
  //       plateSecondController.text.isNotEmpty) {
  //     if(acceptedTerms){
  //       Helper().loading();
  //       // final prefs = await SharedPreferences.getInstance();
  //       var body = {
  //         'firstname': '${fNameController.text}',
  //         'lastname': '${lNameController.text}',
  //         'email': '${emailController.text}',
  //         'age': '$age',
  //         'gender': 'female',
  //         'phone_number':
  //         '${(prefixNumber + phoneController.text).replaceAll(' ', '')}',
  //         'city_id': '${selectedCity!.id}',
  //         'country_id': '${selectedCountry!.id}',
  //         'cityar': '${selectedCity!.name}',
  //         'latitude': '24.6500',
  //         'longitude': '46.7100',
  //         'sequenceNumber': '${sequenceNumber.text}',
  //         'password': 'password',
  //         'driverId': '${driverIDController.text}',
  //         'model_car': '${selectedCarModel!.id!}',
  //         'car_brand': '${selectedCarBrand!.id!}',
  //         'year_of_manufacture': '${yearManufacture!}',
  //         'car_id': '${selectedCarType!.id}',
  //         'type_car': '${selectedCarType!.id}',
  //         'color_car': '${selectedCarColor!.id!}',
  //         'vehiclePlate_left': '${plateFirstController.text.split(' ')[2]}',
  //         'vehiclePlate_right': '${plateFirstController.text.split(' ')[0]}',
  //         'vehiclePlate_middle': '${plateFirstController.text.split(' ')[1]}',
  //         'vehiclePlate_number': '${plateSecondController.text}',
  //       };
  //       Map<String, File> files = {};
  //
  //       if (drivingLicenseFromFront != null) {
  //         files.putIfAbsent(
  //             'front_drivingl_icense', () => drivingLicenseFromFront!);
  //       }
  //       if (drivingLicenseFromBehindImage != null) {
  //         files.putIfAbsent('driving_license_from_behind',
  //                 () => drivingLicenseFromBehindImage!);
  //       }
  //       if (notSentencedImage != null) {
  //         files.putIfAbsent('not_sentenced', () => notSentencedImage!);
  //       }
  //       if (medicalExaminationImage != null) {
  //         files.putIfAbsent(
  //             'medical_examination', () => medicalExaminationImage!);
  //       }
  //       if (licensePlateImage != null) {
  //         files.putIfAbsent('license_plate', () => licensePlateImage!);
  //       }
  //       if (carInsuranceImage != null) {
  //         files.putIfAbsent('car_insurance', () => carInsuranceImage!);
  //       }
  //       if (drivingLicenseImage != null) {
  //         files.putIfAbsent('driving_license', () => drivingLicenseImage!);
  //       }
  //
  //       print('RegisterBody $body');
  //       APIRequest()
  //           .multiPartMethodRequest(ApiUrls.driverRegister,
  //           {'Accept': 'application/json'}, body, files)
  //           .then((value) {
  //         Get.back();
  //         print('asdsv $value');
  //
  //         if (!value.toString().contains('The phone')) {
  //           if (value['token'] != null) {
  //             Get.put(PhoneLoginViewModel());
  //             Get.deleteAll();
  //             Get.offAll(LogInPhone());
  //             Helper().showHint('تم التسجيل بنجاح',
  //                 "تم تقديم طلب التسجيل، يرجى انتظار الموافقة");
  //           } else {
  //             Get.back();
  //           }
  //         } else {
  //           Get.back();
  //         }
  //       });
  //     }else{
  //       Helper()
  //           .showError('شروط الخدمة والخصوصية', 'يرجى التأكد من الموافقة على شروط الخدمة والخصوصية');
  //     }
  //   } else {
  //     Helper()
  //         .showError('تعبئة البيانات', 'يرجى التأكد من تعبئة جميع البيانات');
  //   }
  // }

  bool isRTL(String text) {
    return intl.Bidi.detectRtlDirectionality(text);
  }

  AnimationController? countdownController;
  bool resend = false;

  runTimer() {
    if (countdownController != null) {
      countdownController!.forward().whenComplete(() {
        resend = true;
        update();
      }).catchError((e) {});
    }
  }

  PhoneAuthCredential? _phoneAuthCredential;

  String _verificationId = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void verifyPhoneNumber(String phone) async {

      PhoneVerificationCompleted verificationCompleted =
          (PhoneAuthCredential phoneAuthCredential) async {
        _phoneAuthCredential = phoneAuthCredential;
        await _auth.signInWithCredential(phoneAuthCredential);
        logMessage(
            "Phone number automatically verified and user signed in: ${_auth.currentUser!.uid}");
      };
      PhoneVerificationFailed verificationFailed =
          (FirebaseAuthException authException) {
        logMessage(
            'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
      };

      void codeSent(String verificationId, [int? forceResendingToken]) async {
        logMessage('Please check your phone for the verification code.');
        _verificationId = verificationId;

        runTimer();
        update();
      }

      PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
          (String verificationId) {
        try {
          logMessage("verification code: " + verificationId);
          _verificationId = verificationId;
          try {
            if (_phoneAuthCredential != null)
              verificationCompleted(_phoneAuthCredential!);
          } on Exception catch (e) {
            // TODO
          }
        } on Exception catch (e) {
          logMessage("PhoneCode Auto Retrieval Timeout: ${e}");
        }
      };

      try {
        print('final Phone: $phone');
        await _auth.verifyPhoneNumber(
            phoneNumber: phone,
            timeout: const Duration(seconds: 60),
            verificationCompleted: verificationCompleted,
            verificationFailed: verificationFailed,
            codeSent: codeSent,
            codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
      } catch (e) {
        logMessage("Failed to Verify Phone Number: ${e}");
      }
    }


  void logMessage(String message) {
    log(message, name: 'OTP');
  }

  final TextEditingController smsController = TextEditingController();
  String verifiedNumber = '';

  Future<bool> signInWithPhoneNumber() async {
    Helper().loading();

    print('_verificationId $_verificationId');
    print('smsController ${smsController.text}');
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsController.text,
      );

      final User user = (await _auth.signInWithCredential(credential)).user!;
      logMessage("Successfully signed in UID: ${user.uid}");
      // login(user.phoneNumber!);


      isVerify = true;
      verifiedNumber =
          (prefixNumber + phoneController.text).replaceAll(' ', '');
      update();
      return true;
    } catch (e) {
      logMessage("Failed to sign in: " + e.toString());
      return false;
    }
  }


}
Widget buttonLogIn({
  required BuildContext context,
  required String text,
  required Function function,
}) {
  return Row(
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              primary: AppColors.blue,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            onPressed: () => function(),
          ),
        ),
      ),
    ],
  );
}
