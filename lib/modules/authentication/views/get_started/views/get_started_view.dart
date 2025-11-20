import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_colors.dart';
import 'package:my_own_product/core/routes/app_routes.dart';
import 'package:my_own_product/core/utils/custom_container.dart';
import 'package:my_own_product/core/utils/custom_text.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Center(
            child: CustomContainer(
              onTap: () {
                Get.toNamed(AppRoutes.onboardingPage1.name);
              },
              color: AppColors.buttonColor,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              borderRadius: 40,
              width: double.infinity,
              child: CustomText(text: 'Get Started'),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
