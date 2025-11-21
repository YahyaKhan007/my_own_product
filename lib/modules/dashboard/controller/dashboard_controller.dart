import 'package:get/get.dart';
import 'package:my_own_product/modules/dashboard/sub_modules/chat/views/chat_screen.dart';
import 'package:my_own_product/modules/dashboard/sub_modules/home/views/home_screen.dart';
import 'package:my_own_product/modules/dashboard/sub_modules/profile/views/profile_screen.dart';

class DashboardController extends GetxController{

  RxInt currentScreenIndex = 1.obs;

  final appPages = [
    HomeScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

}
