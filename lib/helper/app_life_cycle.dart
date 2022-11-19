import 'dart:developer';

import 'package:get/get.dart';


class LifeCycleController extends SuperController {


  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete {

    log('onDelete',name: 'appStatus');
    return super.onDelete;
  }

 @override
  void onDetached() {
    log('onDetached',name: 'appStatus');
  }

  @override
  void onInactive() {
    log('onInactive',name: 'appStatus');
 }

  @override
  void onPaused() {
    log('onPaused',name: 'appStatus');
  }

  @override
  void onResumed() {
    log('onResumed',name: 'appStatus');
  }

}