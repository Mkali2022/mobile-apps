import 'package:driver_app/utils/localization/ar.dart';
import 'package:driver_app/utils/localization/en.dart';
import 'package:get/get.dart';



class Translation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ar': ar,
      };
}
