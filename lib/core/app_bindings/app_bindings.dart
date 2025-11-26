import 'package:get/get.dart';
import 'package:my_own_product/modules/authentication/controller/auth_controller.dart';
import 'package:my_own_product/modules/drawer/controller/drawer_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AuthController());
    Get.put(AppDrawerController());
  }
}
