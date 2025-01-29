import 'package:get/get.dart';
import 'package:live_class_project/counter_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounterController());
    // Get.put(() => CounterController());
    // Get.put(() => CounterController());
    // Get.put(() => CounterController());
  }
}