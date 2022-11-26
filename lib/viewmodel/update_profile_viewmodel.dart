import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileViewModel extends GetxController{
  TextEditingController firstNameController = TextEditingController(text: "Abdullah");
  TextEditingController lastNameController = TextEditingController(text: "Alshaikh");
  TextEditingController emailController = TextEditingController(text: "abdullahalshaikhh@outlook.com");
  TextEditingController addressController = TextEditingController(text: "Amman,abunsair,street 31,XWY");
  String? age;
  Future<void> selectDate(BuildContext context) async {
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
      age = '${value?.day}-${value?.month}-${value?.year}';
      update();
    });
  }
}