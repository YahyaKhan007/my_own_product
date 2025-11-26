import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_colors.dart';
import 'package:my_own_product/core/routes/app_routes.dart';
import 'package:my_own_product/core/utils/base_scaffold.dart';
import 'package:my_own_product/core/utils/custom_container.dart';
import 'package:my_own_product/core/utils/custom_text.dart';
import 'package:my_own_product/modules/authentication/views/widgets/auth_appbar.dart';
import 'package:my_own_product/modules/authentication/views/widgets/auth_buttons.dart';

class PurposeScreen extends StatelessWidget {
  const PurposeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      safeBottom: true,
      top: true,
      appBar: authAppBar(
        height: Get.height * 0.15,
        pageName: 'Purpose',
        pageDescription:
            'Why are you using this app select your preference please..',
      ),
      bottom: SizedBox(
        height: 40,
        child: CustomButton(
          color: AppColors.buttonColor,
          borderRadius: 16,

          padding: EdgeInsets.symmetric(vertical: 8),

          onTap: () {
            Get.toNamed(AppRoutes.dashboardScreen.name);
          },

          isExpanded: false,
          child: CustomText(text: 'Signup'),
        ).paddingSymmetric(horizontal: 32),
      ).paddingSymmetric(vertical: 24),

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            purposeOption(
              purposeImagePath: 'assets/images/purpose1.png',
              fieldText: "Making international friends",
            ),
            SizedBox(height: 16),
            purposeOption(
              purposeImagePath: 'assets/images/purpose2.png',
              fieldText: "  Learning foreign language skills",
            ),
          ],
        ),
      ),
    );
  }

  Widget purposeOption({
    required String purposeImagePath,
    required String fieldText,
  }) {
    return CustomContainer(
      width: double.infinity,
      borderColor: Colors.grey,
      borderRadius: 12,

      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Image.asset(purposeImagePath, width: 100, height: 100),
            SizedBox(height: 8),
            CustomText(
              text: fieldText,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ).paddingSymmetric(vertical: 16),
    ).paddingSymmetric(horizontal: 72);
  }
}
