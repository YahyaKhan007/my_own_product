import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_colors.dart';
import 'package:my_own_product/core/routes/app_routes.dart';
import 'package:my_own_product/core/utils/custom_container.dart';
import 'package:my_own_product/core/utils/custom_text.dart';
import 'package:my_own_product/modules/authentication/controller/auth_controller.dart';
import 'package:my_own_product/modules/authentication/views/widgets/auth_appbar.dart';
import 'package:my_own_product/modules/authentication/views/widgets/auth_buttons.dart';

import 'dummy_country_picker.dart';

class BasicInfoScreen extends StatelessWidget {
  final AuthController authController = Get.find();
   BasicInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar(
        height: Get.height * 0.15,
        pageName: 'Basic Information',
        pageDescription:
            'Please provide the basic information so we can create your profile',
      ),
      bottomNavigationBar: SizedBox(
        height: 40,
        child: CustomButton(
          color: AppColors.buttonColor,
          borderRadius: 16,
          // width: double.infinity,
          // height: 48,
          padding: EdgeInsets.symmetric(vertical: 8),

          onTap: () {},

          isExpanded: false,
          child: CustomText(text: 'Next'),
        ).paddingSymmetric(horizontal: 32),
      ).paddingSymmetric(vertical: 24),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.1),
            basicInfoOption(
              initialText: 'I’m from',
              value: authController.selectedCountry,
              onTap: () {
                Get.toNamed(AppRoutes.iAmFrom.name);
                // Get.to(DummyCountryPicker());
              },
            ),SizedBox(height: 16),
            basicInfoOption(
              initialText: 'Native language',

              value: ''.obs,
              onTap: () {
                Get.toNamed(AppRoutes.spokenLanguageScreen.name, arguments: {
                  'isNative': true,

                });

              },
            )
          ,SizedBox(height: 16),
        basicInfoOption(
          initialText: 'Spoken Languages',
          value: ''.obs,
          onTap: () {
            Get.toNamed(AppRoutes.spokenLanguageScreen.name,arguments: {
            'isNative': false,

            });

          },
        ),
            SizedBox(height: 16),
            basicInfoOption(
              initialText: 'I’m learning',
              value: ''.obs,
              onTap: () {
                Get.toNamed(AppRoutes.iAmLearningScreen.name);

              },
            ),
          ],
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }

  Widget basicInfoOption({
    required String initialText,
    required RxString value,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
        borderRadius: 12,
        borderColor: Colors.grey,
        child: Row(
          children: [
            Expanded(
              child: CustomText(
                text: initialText,
                textStyle: TextStyle(fontSize: 14),
              ),
            ),
            Obx(
              () => Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: value.isNotEmpty
                      ? CustomText(text: value.value, textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)
                      : Container(
                    height: 8,
                          width: 8,
                          decoration: BoxDecoration(shape: BoxShape.circle,
                          color: AppColors.buttonColor),

                          ),
                ),
                      ),

            ),
            SizedBox(width: 16,),
            Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ).paddingSymmetric(vertical: 8),

        // child:
        // Column(
        //   mainAxisSize: MainAxisSize.min,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     CustomText(text: fieldName, textStyle: TextStyle(fontSize: 14)),
        //     SizedBox(height: 8),
        //     CustomTextField(onChange: onChange, hintText: fieldHint,
        //       textInputType:textInputType ?? TextInputType.emailAddress,
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
