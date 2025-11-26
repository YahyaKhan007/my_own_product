import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_colors.dart';
import 'package:my_own_product/core/utils/base_scaffold.dart';
import 'package:my_own_product/modules/dashboard/controller/dashboard_controller.dart';
import 'package:my_own_product/modules/drawer/controller/drawer_controller.dart';

import '../../drawer/view/drawer_screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final DashboardController dashboardController = Get.put(
    DashboardController(),
  );

  final AppDrawerController drawerController = Get.find<AppDrawerController>();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      safeBottom: true,
      top: true,
      body: Obx(
        () => AdvancedDrawer(
          disabledGestures: true,
          rtlOpening: true,
          controller: drawerController.advancedDrawerController,
          drawer: dashboardController.currentScreenIndex.value == 4
              ? ProfileDrawerMenuScreen()
              : MainDrawerMenuScreen(),
          child: dashboardController
              .appPages[dashboardController.currentScreenIndex.value],
        ),
      ),

      // Obx(
      //   () => dashboardController
      //       .appPages[dashboardController.currentScreenIndex.value],
      // ),
      bottom: appBottomBar(),
    );
  }

  Widget appBottomBar() {
    final AppDrawerController drawerController = Get.find();
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: bottomBarItem(
              index: 0,
              imagePath: 'assets/icons/voiceIcon.png',
              onTap: () {
                if (drawerController.isDrawerOpen.value) {
                  drawerController.closeDrawer();
                } else {
                  dashboardController.currentScreenIndex.value = 0;
                }
              },
            ),
          ),
          Expanded(
            child: bottomBarItem(
              index: 1,
              imagePath: 'assets/icons/exploreIcon.png',
              onTap: () {
                if (drawerController.isDrawerOpen.value) {
                  drawerController.closeDrawer();
                } else {
                  dashboardController.currentScreenIndex.value = 1;
                }
              },
            ),
          ),
          Expanded(
            child: bottomBarItem(
              index: 2,
              imagePath: 'assets/icons/chatIcon.png',
              onTap: () {
                if (drawerController.isDrawerOpen.value) {
                  drawerController.closeDrawer();
                } else {
                  dashboardController.currentScreenIndex.value = 2;
                }
              },
            ),
          ),
          Expanded(
            child: bottomBarItem(
              index: 3,
              imagePath: 'assets/icons/find_friends_icon.png',
              onTap: () {
                if (drawerController.isDrawerOpen.value) {
                  drawerController.closeDrawer();
                } else {
                  dashboardController.currentScreenIndex.value = 3;
                }
              },
            ),
          ),

          Expanded(
            child: bottomBarItem(
              index: 4,
              imagePath: 'assets/icons/profileIcon.png',
              onTap: () {
                if (drawerController.isDrawerOpen.value) {
                  drawerController.closeDrawer();
                } else {
                  dashboardController.currentScreenIndex.value = 4;
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomBarItem({
    required String imagePath,
    required int index,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Obx(
        () => SizedBox(
          height: 24,
          child: Image.asset(
            imagePath,
            color: dashboardController.currentScreenIndex.value == index
                ? AppColors.buttonColor
                : Colors.black,
          ),
        ),
      ),
    );
  }
}
