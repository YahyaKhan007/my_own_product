import 'package:get/get.dart';
import 'package:my_own_product/modules/dashboard/sub_modules/chat/views/chat_screen.dart';
import 'package:my_own_product/modules/dashboard/sub_modules/profile/views/profile_screen.dart';
import 'package:my_own_product/modules/dashboard/sub_modules/voice_room/views/voice_room_screen.dart';
import 'package:my_own_product/modules/dashboard/sub_modules/world_map/views/world_map_screen.dart';

import '../sub_modules/find_friends/views/find_friends_screen.dart';

class DashboardController extends GetxController {
  RxInt currentScreenIndex = 2.obs;

  final appPages = [
    VoiceRoomScreen(),
    // HomeScreen(),
    WorldMapScreen(),
    ChatScreen(),
    FindFriendsScreen(),
    CurrentProfileScreen(),
  ];
}
