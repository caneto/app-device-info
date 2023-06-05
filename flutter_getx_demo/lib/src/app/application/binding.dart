import 'package:fluttergetxdemo/src/app/application/controller.dart';
import 'package:get/get.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Controller());
  }
}