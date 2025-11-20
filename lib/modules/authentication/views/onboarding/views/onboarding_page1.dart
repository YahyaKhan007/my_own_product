import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_colors.dart';
import 'package:my_own_product/core/routes/app_routes.dart';
import 'package:my_own_product/modules/authentication/views/widgets/auth_buttons.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/onb1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SocialLogin(
                    iconPath: 'assets/icons/facebook.png',
                    onPressed: () {},
                  ),
                  SizedBox(width: 16,),
                  SocialLogin(
                    iconPath: 'assets/icons/facebook.png',
                    onPressed: () {},
                  ),
                  SizedBox(width: 16,),

                  SocialLogin(
                    iconPath: 'assets/icons/facebook.png',
                    onPressed: () {},
                  ),
                ],
              )
            ),
            SizedBox(height: 16),

            EmailLoginButton(
              buttonText: "Login with Email Password",
              iconPath: 'assets/icons/emailPng.png',
              onPressed: () {
                Get.toNamed(AppRoutes.loginScreen.name);
              },
            ),
            SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.center,
              maxLines: 5,
              text: TextSpan(
                text:
                    "Your first login creates your account, and in doing so you agree to our ",
                style: TextStyle(color: Colors.black26),
                children: [
                  TextSpan(
                    text: "Terms and Services",
                    style: TextStyle(
                      color: AppColors.buttonColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: " and ",
                    style: TextStyle(color: Colors.black26),
                  ),
                  TextSpan(
                    text: "Privacy Policy",
                    style: TextStyle(
                      color: AppColors.buttonColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),

            GestureDetector(
              onTap: (){
                Get.toNamed(AppRoutes.signupScreen.name);
              },
                
              child: RichText(
                textAlign: TextAlign.center,
                maxLines: 5,
                text: TextSpan(
                  text: "Don't have an account ? ",
                  style: TextStyle(color: Colors.black26),
                  children: [
                    TextSpan(
                      text: "Signup",
                      style: TextStyle(
                        color: AppColors.buttonColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16,),

          ],
        ).paddingSymmetric(horizontal: 24),
      ),
    );
  }
}
