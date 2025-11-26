import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_colors.dart';
import 'package:my_own_product/core/utils/custom_text.dart';
import 'package:my_own_product/modules/drawer/controller/drawer_controller.dart';

class MainDrawerMenuScreen extends StatelessWidget {
  const MainDrawerMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.buttonColor.withValues(alpha: 0.7),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.height * 0.3),
        child: SizedBox(height: Get.height * 0.3),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
            topRight: Radius.circular(0),
          ),

          color: Colors.white,
        ),
      ),
    );
  }
}

class ProfileDrawerMenuScreen extends StatelessWidget {
  const ProfileDrawerMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.withValues(alpha: 0.7),
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(Get.height * 0.1),
      //   child: SizedBox(height: Get.height * 0.1),
      // ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                Get.find<AppDrawerController>().closeDrawer();
              },
              child: CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.buttonColor,
                child: Center(
                  child: Icon(Icons.close, color: Colors.black, size: 16),
                ),
              ),
            ),
          ).paddingOnly(left: 8),
          SizedBox(height: 24),
          drawerOption(
            title: 'Learning Setting',
            onTap: () {},
            icon: Icons.book,
          ),
          drawerOption(
            title: 'About',
            onTap: () {},
            icon: Icons.account_box_outlined,
          ),
        ],
      ),
    );
  }
}

Widget drawerOption({
  required String title,
  required VoidCallback onTap,
  required IconData icon,
}) {
  return ListTile(
    onTap: onTap,
    leading: Icon(icon),
    title: CustomText(
      text: title,
      textStyle: TextStyle(color: Colors.black, fontSize: 14),
    ),
    trailing: Icon(Icons.arrow_forward_ios, size: 16),
    contentPadding: EdgeInsets.only(left: 16, right: 16),
  );
}
