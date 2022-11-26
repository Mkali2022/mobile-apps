import 'package:driver_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';


class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Language'.tr,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {
                final sharedPreferences =
                await SharedPreferences.getInstance();
                setState(() {
                  appLanguage = 'en';
                  sharedPreferences.setString(
                      "LANGUAGE_CODE", appLanguage);
                });
                Get.updateLocale(Locale(appLanguage));

              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                decoration:  BoxDecoration(
                  color:appLanguage == 'en'? Colors.green.shade200 :Colors.white,
                  border: const Border(
                    bottom: BorderSide(
                        width: 1.0,
                        color: Colors.grey
                    ),
                    top: BorderSide(
                        width: 1.0,
                        color: Colors.grey
                    ),
                    left: BorderSide(
                        width: 1.0,
                        color: Colors.grey
                    ),
                    right: BorderSide(
                        width: 1.0,
                        color: Colors.grey
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/united_kindom.png', width: 34, height: 34),
                          const SizedBox(width: 30),
                          Text(
                            'English',
                            style: Theme.of(context).textTheme.headline5!.copyWith(
                                color: AppColors.blue
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {
                final sharedPreferences =
                await SharedPreferences.getInstance();
                setState(() {
                  appLanguage = 'ar';
                  sharedPreferences.setString(
                      "LANGUAGE_CODE", appLanguage);
                });
                Get.updateLocale(Locale(appLanguage));

              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                decoration:  BoxDecoration(
                  color: appLanguage == 'ar'? Colors.green.shade200 :Colors.white,
                  border: const Border(
                    bottom: BorderSide(
                        width: 1.0,
                        color: Colors.grey
                    ),
                    top: BorderSide(
                        width: 1.0,
                        color: Colors.grey
                    ),
                    left: BorderSide(
                        width: 1.0,
                        color: Colors.grey
                    ),
                    right: BorderSide(
                        width: 1.0,
                        color: Colors.grey
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/arabic.png', width: 34, height: 38),
                          const SizedBox(width: 30),
                          Text(
                            "العربية",
                            style: Theme.of(context).textTheme.headline5!.copyWith(
                                color: AppColors.blue
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {
                final sharedPreferences =
                await SharedPreferences.getInstance();
                setState(() {
                  appLanguage = 'ur';
                  sharedPreferences.setString(
                      "LANGUAGE_CODE", appLanguage);
                });
                Get.updateLocale(Locale(appLanguage));

              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                decoration:  BoxDecoration(
                  color: appLanguage == 'ur'? Colors.green.shade200 :Colors.white,
                  border: const Border(
                    bottom: BorderSide(
                        width: 1.0,
                        color: Colors.grey
                    ),
                    top: BorderSide(
                        width: 1.0,
                        color: Colors.grey
                    ),
                    left: BorderSide(
                        width: 1.0,
                        color: Colors.grey
                    ),
                    right: BorderSide(
                        width: 1.0,
                        color: Colors.grey
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/urdu.png', width: 34, height: 38),
                          const SizedBox(width: 30),
                          Text(
                            "URDU",
                            style: Theme.of(context).textTheme.headline5!.copyWith(
                                color: AppColors.blue
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
