import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_colors.dart';
import 'package:my_own_product/core/routes/app_routes.dart';
import 'package:my_own_product/core/utils/custom_text.dart';
import 'package:my_own_product/core/utils/custom_text_field.dart';
import 'package:my_own_product/modules/authentication/views/widgets/auth_appbar.dart';
import 'package:my_own_product/modules/authentication/views/widgets/auth_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar(
        height: Get.height * 0.15,
        pageName: 'Login',
        pageDescription: 'Please enter Email and Password',
      ),
      bottomNavigationBar: SizedBox(
        height: 40,
        child: CustomButton(
          color: AppColors.buttonColor,
          borderRadius: 16,
          // width: double.infinity,
          // height: 48,
          padding: EdgeInsets.symmetric(vertical: 8),

          onTap: () {
            Get.toNamed(AppRoutes.dashboardScreen.name);
          },

          isExpanded: false,
          child: CustomText(text: 'Login'),
        ).paddingSymmetric(horizontal: 32),
      ).paddingSymmetric(vertical: 24),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.15),
            loginOption(
              fieldName: 'Email',
              fieldHint: 'Enter the email',
              onChange: (String value) {},
            ),
            SizedBox(height: 8),
            loginOption(
              fieldName: 'Password',
              fieldHint: 'Enter the password',
              textInputType: TextInputType.visiblePassword,
              onChange: (String value) {},
            ),

            SizedBox(height: 8,),
            GestureDetector(
              onTap: (){
                Get.toNamed(AppRoutes.resetPasswordScreen.name);
              },

              child: Align(
                alignment: Alignment.centerRight,
                child: RichText(
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  text: TextSpan(
                    text: "Forgot Password ?  ",
                    style: TextStyle(color: Colors.black26),
                    children: [
                      TextSpan(
                        text: "Reset here",
                        style: TextStyle(
                          color: AppColors.buttonColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }

  Widget loginOption({
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
