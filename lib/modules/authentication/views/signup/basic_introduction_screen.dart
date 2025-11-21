import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_colors.dart';
import 'package:my_own_product/core/routes/app_routes.dart';
import 'package:my_own_product/core/utils/custom_text.dart';
import 'package:my_own_product/core/utils/custom_text_field.dart';
import 'package:my_own_product/modules/authentication/controller/auth_controller.dart';
import 'package:my_own_product/modules/authentication/views/widgets/auth_appbar.dart';
import 'package:my_own_product/modules/authentication/views/widgets/auth_buttons.dart';
import 'package:my_own_product/modules/authentication/views/widgets/date_selection.dart';
import 'package:my_own_product/modules/authentication/views/widgets/drop_down_selection.dart';

class BasicIntroductionScreen extends StatelessWidget {
  BasicIntroductionScreen({super.key});
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar(
        height: Get.height * 0.15,
        pageName: 'Basic Introduction',
        pageDescription:
            'Please provide your personal information accurate. So we can offer you more personalized experience',
      ),
      bottomNavigationBar: SizedBox(
        height: 40,
        child: CustomButton(
          color: AppColors.buttonColor,
          borderRadius: 16,

          padding: EdgeInsets.symmetric(vertical: 8),

          onTap: () {

            Get.toNamed(AppRoutes.purposeScreen.name);
          },



          isExpanded: false,
          child: CustomText(text: 'Next'),
        ).paddingSymmetric(horizontal: 32),
      ).paddingSymmetric(vertical: 24),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 28),
            profilePictureSection(),
            SizedBox(height: 32),
            introductionOption(
              fieldName: "Name",
              fieldHint: "Please enter your full name",
              onChange: (value) {},
            ),
            Obx(
              () => introductionOption(
                onTap: () async {
                  authController.selectedGender.value = await dropDownSelection(
                    context: context,
                    type: 'gender',
                    options: ['Male', 'Female', 'Other'],
                  );
                },
                readOnly: true,
                fieldName: "Gender",
                fieldHint: authController.selectedGender.value.isNotEmpty
                    ? authController.selectedGender.value
                    : "Please select the gender",
                onChange: (value) {},
              ),
            ),

            Obx(
              () => introductionOption(
                readOnly: true,
                onTap: () async {
                  authController.selectedDateOfBirth.value =
                      await dateSelection(
                        initialDate: DateTime.now().obs,
                        context: context,
                      );
                },
                fieldName: "Date of birth",
                fieldHint: authController.selectedDateOfBirth.value != null
                    ? authController.selectedDateOfBirth.value!.toString()
                    : "Select your date of birth",
                onChange: (value) {},
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }

  Widget introductionOption({
    required String fieldName,
    required String fieldHint,
    TextEditingController? controller,
    bool readOnly = false,
    VoidCallback? onTap,
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
          readonly: readOnly,
          controller: controller,
          onTap: onTap,
          textInputType: textInputType ?? TextInputType.emailAddress,
        ),
      ],
    );
  }

  Widget profilePictureSection() {
    return Center(
      child: CircleAvatar(
        radius: 60,
        backgroundColor: AppColors.buttonColor.withValues(alpha: 0.2),

        child: Stack(
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 56,
              // child: ,
            ),
            Positioned(
              right: 4,
              bottom: 0,
              child: CircleAvatar(
                radius: 12,
                backgroundColor: AppColors.buttonColor,
                child: Center(
                  child: Icon(Icons.add, color: Colors.black, size: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
