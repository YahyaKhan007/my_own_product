import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_colors.dart';
import 'package:my_own_product/core/utils/custom_text.dart';
import 'package:my_own_product/modules/authentication/controller/auth_controller.dart';
import 'package:my_own_product/modules/authentication/views/widgets/auth_appbar.dart';
import 'package:my_own_product/modules/authentication/views/widgets/auth_buttons.dart';

class IAmLearningScreen extends StatelessWidget {
  final AuthController authController = Get.find();

  IAmLearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar(
        height: Get.height * 0.15,
        pageName: "I'm learning",
        pageDescription: "Please select all the languages you are interested to learn",
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: TextField(
              onChanged: (value) {
                authController.searchQuery.value = value;
              },
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'search language',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Color(0xFFE8D5FF), // Light purple background
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () {
                // Access reactive properties to ensure Obx tracks them
                final languages = authController.filteredLanguages;
                // Track changes to selected learning languages via trigger
                final _ = authController.learningLanguagesUpdateTrigger;
                
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    final language = languages[index];
                    
                    return Obx(
                      () {
                        // Access reactive properties for this specific language
                        // Also access trigger to ensure reactivity
                        final _ = authController.learningLanguagesUpdateTrigger;
                        final isSelected = authController.isLearningLanguageSelected(language);
                        
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12),
                          child: _LearningLanguageItem(
                            languageName: language,
                            isSelected: isSelected,
                            onTap: () {
                              authController.toggleLearningLanguage(language);
                            },
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: 40,
            child: CustomButton(
              color: AppColors.buttonColor,
              borderRadius: 16,
              padding: EdgeInsets.symmetric(vertical: 8),
              onTap: () {
                Get.back();
              },
              isExpanded: false,
              child: Obx(
                () => CustomText(
                  text: 'Done'

                ),
              ),
            ).paddingSymmetric(horizontal: 32),
          ).paddingSymmetric(vertical: 24),
        ],
      ),
    );
  }
}

/// Individual learning language item widget (simple selection, no proficiency levels)
class _LearningLanguageItem extends StatelessWidget {
  final String languageName;
  final bool isSelected;
  final VoidCallback onTap;

  const _LearningLanguageItem({
    required this.languageName,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.buttonColor.withValues(alpha: 0.1)
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.buttonColor
                : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Expanded(
              child: CustomText(
                text: languageName,
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected
                      ? AppColors.buttonColor
                      : Colors.black,
                ),
              ),
            ),
            // Selection indicator (checkmark or circle)
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? AppColors.buttonColor
                    : Colors.transparent,
                border: Border.all(
                  color: isSelected
                      ? AppColors.buttonColor
                      : Colors.grey.shade400,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
