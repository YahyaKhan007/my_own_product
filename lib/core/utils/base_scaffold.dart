import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/themes/controller/theme_controller.dart';

class BaseScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget body;
  final Widget? bottom;
  final bool? top;
  final bool? safeBottom;
  final Widget? fab;

  const BaseScaffold({
    required this.body,
    this.appBar,
    this.drawer,
    this.bottom,
    this.safeBottom,
    this.top,
    this.fab,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // or any color
        statusBarIconBrightness: Brightness.light, // for dark icons
        statusBarBrightness: Brightness.light, // for iOS
      ),
    );
    ThemeController themeController = Get.find();

    return Obx(
      () => SafeArea(
        top: top ?? false,
        bottom: safeBottom ?? true,
        child: Scaffold(
          // backgroundColor: AppColors.white,
          backgroundColor:
              themeController.selectedThemeData.value.scaffoldBackgroundColor,
          appBar: appBar,
          drawer: drawer,
          body: body,
          floatingActionButton: fab,
          bottomNavigationBar: bottom,
        ),
      ),
    );
  }
}
