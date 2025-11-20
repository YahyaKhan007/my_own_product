import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_colors.dart';
import 'package:my_own_product/core/utils/custom_text.dart';
import 'package:my_own_product/core/utils/custom_text_field.dart';
import 'package:my_own_product/modules/authentication/views/widgets/auth_appbar.dart';
import 'package:my_own_product/modules/authentication/views/widgets/auth_buttons.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar(
        height: Get.height * 0.15,
        pageName: 'Reset Password',
        pageDescription: 'Please enter the registered email to Reset your Password',
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
          child: CustomText(text: 'Reset Password'),
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
        CustomTextField(onChange: onChange, hintText: fieldHint,
          textInputType:textInputType ?? TextInputType.emailAddress,
        ),
      ],
    );
  }
}
