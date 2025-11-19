import 'package:get/get.dart';
import 'package:my_own_product/modules/autentication/views/get_started/views/get_started_view.dart';
import 'package:my_own_product/modules/autentication/views/onboarding/views/onboarding_page1.dart';
import 'package:my_own_product/modules/autentication/views/splash/view/splash_view.dart';

enum AppRoutes { initial, getStarted, onboardingPage1 }

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.initial.path, page: () => const SplashView()),
    GetPage(name: AppRoutes.getStarted.path, page: () => const GetStartedView()),
    GetPage(name: AppRoutes.onboardingPage1.path, page: () => const OnboardingPage1()),
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

      // Default route
    }
  }
}
