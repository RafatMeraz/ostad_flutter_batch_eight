import 'package:ecommerce/features/auth/ui/controllers/auth_controller.dart';
import 'package:get/get.dart';

class MainBottomNavBarController extends GetxController {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void changeIndex(int index) {
    if (index == 2 || index == 3) {
      if (Get.find<AuthController>().isValidUser() == false) {
        // Show alert
        return;
      }
    }
    _selectedIndex = index;
    update();
  }

  void moveToCategory() {
    changeIndex(1);
  }

  void backToHome() {
    changeIndex(0);
  }
}
