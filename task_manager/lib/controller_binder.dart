import 'package:get/get.dart';
import 'package:task_manager/ui/controllers/new_task_controller.dart';
import 'package:task_manager/ui/controllers/sign_in_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
    Get.put(NewTaskController());
  }
}
