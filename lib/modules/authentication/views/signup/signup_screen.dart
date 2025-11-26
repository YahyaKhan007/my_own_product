import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_colors.dart';
import 'package:my_own_product/core/routes/app_routes.dart';
import 'package:my_own_product/core/utils/base_scaffold.dart';
import 'package:my_own_product/core/utils/custom_text.dart';
import 'package:my_own_product/core/utils/custom_text_field.dart';
import 'package:my_own_product/modules/authentication/views/widgets/auth_appbar.dart';
import 'package:my_own_product/modules/authentication/views/widgets/auth_buttons.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      safeBottom: true,
      top: true,
      appBar: authAppBar(
        height: Get.height * 0.15,
        pageName: 'Signup',
        pageDescription: 'Please create an account using email and password',
      ),
      bottom: SizedBox(
        height: 40,
        child: CustomButton(
          color: AppColors.buttonColor,
          borderRadius: 16,
          // width: double.infinity,
          // height: 48,
          padding: EdgeInsets.symmetric(vertical: 8),

          onTap: () {
            Get.toNamed(AppRoutes.basicInfoScreen.name);
          },

          isExpanded: false,
          child: CustomText(text: 'Next'),
        ).paddingSymmetric(horizontal: 32),
      ).paddingSymmetric(vertical: 24),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.1),
            signupOption(
              fieldName: 'Email',
              fieldHint: 'Enter the email',
              onChange: (String value) {},
            ),
            SizedBox(height: 8),
            signupOption(
              textInputType: TextInputType.visiblePassword,
              fieldName: 'Password',
              fieldHint: 'Enter the password',

              onChange: (String value) {},
            ),
            SizedBox(height: 8),
            signupOption(
              textInputType: TextInputType.visiblePassword,

              fieldName: 'Confirm Password',
              fieldHint: 'Enter password again',
              onChange: (String value) {},
            ),
          ],
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }

  Widget signupOption({
    required String fieldName,
    required String fieldHint,
    TextInputType? textInputType,
    required Function(String value) onChange,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: fieldName, textStyle: TextStyle(fontSize: 14)),
        SizedBox(height: 8),
        CustomTextField(
          onChange: onChange,
          hintText: fieldHint,
          textInputType: textInputType ?? TextInputType.emailAddress,
        ),
      ],
    );
  }
}
