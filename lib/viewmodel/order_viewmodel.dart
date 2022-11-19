import 'package:get/get.dart';

class OrderViewModel extends GetxController{
  List<String> status = [
    "On the way to pickup",
    "On the way to customer",
    "Arrived to customer",
    "Delivered",
  ];
  int index = 0;
}