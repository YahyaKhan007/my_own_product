
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_colors.dart';
import 'package:my_own_product/core/data/app_data.dart';
import 'package:my_own_product/core/utils/custom_text.dart';
import 'package:my_own_product/modules/authentication/controller/auth_controller.dart';
import 'package:my_own_product/modules/authentication/views/widgets/auth_appbar.dart';
import 'package:my_own_product/modules/authentication/views/widgets/auth_buttons.dart';

class ICanSpeakScreen extends StatelessWidget {
  final AuthController authController = Get.find();

  ICanSpeakScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar(
        height: Get.height * 0.15,
        pageName: "I Can Speak",
        pageDescription: "Please select all the languages that you can speak",
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
                // Track changes to expanded and selected languages via trigger
                final _ = authController.updateTrigger;
                
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    final language = languages[index];
                    
                    return Obx(
                      () {
                        // Access reactive properties for this specific language
                        // Also access trigger to ensure reactivity
                        final _ = authController.updateTrigger;
                        final isExpanded = authController.expandedLanguages.contains(language);
                        final selectedLevel = authController.selectedLanguages[language];
                        
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12),
                          child: _LanguageItem(
                            languageName: language,
                            isExpanded: isExpanded,
                            selectedLevel: selectedLevel,
                            proficiencyLevels: AppData.proficiencyLevels,
                            onToggle: () {
                              authController.toggleLanguageExpansion(language);
                            },
                            onLevelSelected: (level) {
                              authController.selectLanguageLevel(language, level);
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
              // width: double.infinity,
              // height: 48,
              padding: EdgeInsets.symmetric(vertical: 8),

              onTap: () {

                Get.back();
              },

              isExpanded: false,
              child: CustomText(text: 'Done'),
            ).paddingSymmetric(horizontal: 32),
          ).paddingSymmetric(vertical: 24),

        ],
      ),
    );
  }
}

/// Individual language item widget with expandable proficiency levels
class _LanguageItem extends StatelessWidget {
  final String languageName;
  final bool isExpanded;
  final int? selectedLevel;
  final List<Map<String, dynamic>> proficiencyLevels;
  final VoidCallback onToggle;
  final Function(int level) onLevelSelected;

  const _LanguageItem({
    required this.languageName,
    required this.isExpanded,
    required this.selectedLevel,
    required this.proficiencyLevels,
    required this.onToggle,
    required this.onLevelSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha:0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Language header (always visible)
          InkWell(
            onTap: onToggle,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(12),
              bottom: Radius.circular(isExpanded ? 0 : 12),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: CustomText(
                      text: languageName,
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // Show selected level indicator if selected
                  if (selectedLevel != null)
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: CustomText(
                          text: proficiencyLevels[selectedLevel!]['name'],
                          textStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.buttonColor,
                          ),
                        ),
                      ),
                    ),
                  // Expand/collapse icon
                  Icon(
                    isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
                    color: Colors.pink,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
          // Proficiency levels (shown when expanded)
          if (isExpanded)
            Container(
              padding: EdgeInsets.only(bottom: 8),
              child: Column(
                children: proficiencyLevels.map((level) {
                  final levelIndex = level['level'] as int;
                  final isSelected = selectedLevel == levelIndex;
                  final dotsCount = level['dots'] as int;

                  return InkWell(
                    onTap: () => onLevelSelected(levelIndex),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      color: isSelected
                          ? AppColors.buttonColor.withValues(alpha:0.05)
                          : Colors.transparent,
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomText(
                              text: level['name'],
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                                color: isSelected
                                    ? AppColors.buttonColor
                                    : Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          // Dots indicator
                          Row(
                            children: List.generate(5, (index) {
                              final isFilled = index < dotsCount;
                              return Container(
                                margin: EdgeInsets.only(left: 4),
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isFilled
                                      ? AppColors.buttonColor
                                      : Colors.grey.shade300,
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}


