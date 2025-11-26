import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_colors.dart';
import 'package:my_own_product/core/utils/custom_text.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: authAppBar(
      // top: true,
      body: SizedBox(
        height: Get.height,
        child: Stack(
          children: [
            Container(
              height: Get.height * 0.3,
              width: Get.width,
              decoration: BoxDecoration(color: AppColors.buttonColor),
              child: Image.network(
                'https://i.pinimg.com/236x/4d/7d/fd/4d7dfdae8d25a2ca202c357cf4f0a732.jpg',
                fit: BoxFit.cover,
              ),
            ),

            Positioned.fill(
              top: Get.height * 0.26,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  color: Colors.white,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 44),
                    CustomText(
                      text: 'Random User',
                      textStyle: TextStyle(
                        color: AppColors.buttonColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 24),
              ),
            ),
            Positioned(
              left: 24,
              top: Get.height * 0.21,
              child: CircleAvatar(radius: 40),
            ),
          ],
        ),
      ),
    );
  }
}
