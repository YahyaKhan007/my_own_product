import 'package:get/get.dart';
import 'package:my_own_product/modules/authentication/views/get_started/views/get_started_view.dart';
import 'package:my_own_product/modules/authentication/views/login/login_screen.dart';
import 'package:my_own_product/modules/authentication/views/onboarding/views/onboarding_page1.dart';
import 'package:my_own_product/modules/authentication/views/reset_password/forgot_password.dart';
import 'package:my_own_product/modules/authentication/views/signup/basic_info_screen.dart';
import 'package:my_own_product/modules/authentication/views/signup/basic_introduction_screen.dart';
import 'package:my_own_product/modules/authentication/views/signup/i_am_from.dart';
import 'package:my_own_product/modules/authentication/views/signup/i_am_learning_screen.dart';
import 'package:my_own_product/modules/authentication/views/signup/i_can_speak.dart';
import 'package:my_own_product/modules/authentication/views/signup/purpose_screen.dart';
import 'package:my_own_product/modules/authentication/views/signup/signup_screen.dart';
import 'package:my_own_product/modules/authentication/views/splash/view/splash_view.dart';
import 'package:my_own_product/modules/dashboard/sub_modules/chat/views/chat_screen.dart';
import 'package:my_own_product/modules/dashboard/sub_modules/find_friends/views/find_friends_screen.dart';
import 'package:my_own_product/modules/dashboard/sub_modules/home/views/home_screen.dart';
import 'package:my_own_product/modules/dashboard/sub_modules/profile/views/profile_screen.dart';
import 'package:my_own_product/modules/dashboard/sub_modules/voice_room/views/voice_room_screen.dart';
import 'package:my_own_product/modules/dashboard/sub_modules/world_map/views/country_users_screen.dart';
import 'package:my_own_product/modules/dashboard/sub_modules/world_map/views/world_map_screen.dart';
import 'package:my_own_product/modules/dashboard/views/dashboard_screen.dart';

import '../../modules/dashboard/sub_modules/chat/views/message_screen.dart';

enum AppRoutes {
  initial,
  getStarted,
  onboardingPage1,
  loginScreen,
  signupScreen,
  resetPasswordScreen,
  basicInfoScreen,
  iAmFrom,
  iCanSpeakScreen,
  iAmLearningScreen,
  basicIntroductionScreen,
  purposeScreen,
  homeScreen,
  chatScreen,
  profileScreen,
  dashboardScreen,
  voiceRoomScreen,
  findFriendsScreen,
  messageScreen,
  worldMapScreen,
  countryUsersScreen,
  // Add more routes here
}

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.initial.path, page: () => const SplashView()),
    GetPage(
      name: AppRoutes.getStarted.path,
      page: () => const GetStartedView(),
    ),
    GetPage(
      name: AppRoutes.onboardingPage1.path,
      page: () => const OnboardingPage1(),
    ),
    GetPage(name: AppRoutes.loginScreen.path, page: () => const LoginScreen()),
    GetPage(
      name: AppRoutes.signupScreen.path,
      page: () => const SignupScreen(),
    ),
    GetPage(
      name: AppRoutes.resetPasswordScreen.path,
      page: () => const ResetPasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.basicInfoScreen.path,
      page: () => BasicInfoScreen(),
    ),
    GetPage(name: AppRoutes.iAmFrom.path, page: () => IAmFromScreen()),
    GetPage(
      name: AppRoutes.findFriendsScreen.path,
      page: () => FindFriendsScreen(),
    ),
    GetPage(
      name: AppRoutes.voiceRoomScreen.path,
      page: () => VoiceRoomScreen(),
    ),
    GetPage(
      name: AppRoutes.iAmLearningScreen.path,
      page: () => IAmLearningScreen(),
    ),
    GetPage(
      name: AppRoutes.basicIntroductionScreen.path,
      page: () => BasicIntroductionScreen(),
    ),
    GetPage(name: AppRoutes.purposeScreen.path, page: () => PurposeScreen()),
    GetPage(
      name: AppRoutes.profileScreen.path,
      page: () => CurrentProfileScreen(),
    ),
    GetPage(name: AppRoutes.messageScreen.path, page: () => MessageScreen()),
    GetPage(name: AppRoutes.chatScreen.path, page: () => ChatScreen()),
    GetPage(name: AppRoutes.homeScreen.path, page: () => HomeScreen()),
    GetPage(
      name: AppRoutes.dashboardScreen.path,
      page: () => DashboardScreen(),
    ),
    GetPage(
      name: AppRoutes.iCanSpeakScreen.path,
      page: () {
        // final args = Get.arguments; // Extract arguments if needed
        return ICanSpeakScreen(/*isNative: args['isNative']*/);
      },
    ),
    GetPage(
      name: AppRoutes.worldMapScreen.path,
      page: () => const WorldMapScreen(),
    ),
    GetPage(
      name: AppRoutes.countryUsersScreen.path,
      page: () => const CountryUsersScreen(),
    ),
  ];
}

extension AppRoutesExtension on AppRoutes {
  String get path {
    switch (this) {
      case AppRoutes.initial:
        return '/';
      case AppRoutes.getStarted:
        return '/getStarted';
      case AppRoutes.onboardingPage1:
        return '/onboardingPage1';
      case AppRoutes.loginScreen:
        return '/loginScreen';
      case AppRoutes.signupScreen:
        return '/signupScreen';
      case AppRoutes.resetPasswordScreen:
        return '/resetPasswordScreen';
      case AppRoutes.basicInfoScreen:
        return '/basicInfoScreen';
      case AppRoutes.iAmFrom:
        return '/iAmFrom';
      case AppRoutes.iAmLearningScreen:
        return '/iAmLearningScreen';
      case AppRoutes.iCanSpeakScreen:
        return '/iCanSpeakScreen';
      case AppRoutes.basicIntroductionScreen:
        return '/basicIntroductionScreen';
      case AppRoutes.purposeScreen:
        return '/purposeScreen';
      case AppRoutes.homeScreen:
        return '/homeScreen';
      case AppRoutes.chatScreen:
        return '/chatScreen';
      case AppRoutes.profileScreen:
        return '/profileScreen';
      case AppRoutes.dashboardScreen:
        return '/dashboardScreen';
      case AppRoutes.messageScreen:
        return '/messageScreen';
      case AppRoutes.voiceRoomScreen:
        return '/voiceRoomScreen';
      case AppRoutes.findFriendsScreen:
        return '/findFriendsScreen';
      case AppRoutes.worldMapScreen:
        return '/worldMapScreen';
      case AppRoutes.countryUsersScreen:
        return '/countryUsersScreen';

      // Default route
    }
  }
}
