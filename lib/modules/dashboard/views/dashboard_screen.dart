import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_colors.dart';
import 'package:my_own_product/modules/dashboard/controller/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final DashboardController dashboardController = Get.put(
    DashboardController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => dashboardController
            .appPages[dashboardController.currentScreenIndex.value],
      ),
      bottomNavigationBar: appBottomBar(),
    );
  }

  Widget appBottomBar() {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: bottomBarItem(
              index: 0,
              imagePath: 'assets/icons/exploreIcon.png',
              onTap: () {
                dashboardController.currentScreenIndex.value = 0;
              },
            ),
          ),
          Expanded(
            child: bottomBarItem(
              index: 1,
              imagePath: 'assets/icons/chatIcon.png',
              onTap: () {
                dashboardController.currentScreenIndex.value = 1;
              },
            ),
          ),
          Expanded(
            child: bottomBarItem(
              index: 2,
              imagePath: 'assets/icons/profileIcon.png',
              onTap: () {
                dashboardController.currentScreenIndex.value = 2;
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
