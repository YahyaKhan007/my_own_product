import 'package:get/get.dart';
import 'package:my_own_product/modules/authentication/views/get_started/views/get_started_view.dart';
import 'package:my_own_product/modules/authentication/views/login/login_screen.dart';
import 'package:my_own_product/modules/authentication/views/onboarding/views/onboarding_page1.dart';
import 'package:my_own_product/modules/authentication/views/reset_password/forgot_password.dart';
import 'package:my_own_product/modules/authentication/views/signup/basic_info_screen.dart';
import 'package:my_own_product/modules/authentication/views/signup/i_am_from.dart';
import 'package:my_own_product/modules/authentication/views/signup/i_am_learning_screen.dart';
import 'package:my_own_product/modules/authentication/views/signup/signup_screen.dart';
import 'package:my_own_product/modules/authentication/views/signup/spoken_language_screen.dart';
import 'package:my_own_product/modules/authentication/views/splash/view/splash_view.dart';

enum AppRoutes {
  initial,
  getStarted,
  onboardingPage1,
  loginScreen,
  signupScreen,
  resetPasswordScreen,
  basicInfoScreen,
  iAmFrom,
  spokenLanguageScreen,
  iAmLearningScreen,
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
      page: () =>  BasicInfoScreen(),
    ),
    GetPage(name: AppRoutes.iAmFrom.path, page: () =>  IAmFromScreen()),
    GetPage(name: AppRoutes.iAmLearningScreen.path, page: () => const IAmLearningScreen()),
    GetPage(name: AppRoutes.spokenLanguageScreen.path, page:() {
      final args = Get.arguments; // Extract arguments
      return SpokenLanguageScreen(isNative: args['isNative']);
    }
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
        return '/iAmFrom';case AppRoutes.iAmLearningScreen:
        return '/iAmLearningScreen';case AppRoutes.spokenLanguageScreen:
        return '/spokenLanguageScreen';

      // Default route
    }
  }
}
