import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

class AppDrawerController extends GetxController {
  // ZoomDrawerController zoomController = ZoomDrawerController();
  final advancedDrawerController = AdvancedDrawerController();
  RxBool isDrawerOpen = false.obs;

  void toggleDrawer() {
    advancedDrawerController.showDrawer();
    isDrawerOpen.value = true;
  }

  void closeDrawer() {
    advancedDrawerController.hideDrawer();
    isDrawerOpen.value = false;
  }
}
