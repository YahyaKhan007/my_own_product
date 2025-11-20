import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_colors.dart';
import 'package:my_own_product/core/utils/custom_text.dart';
import 'package:my_own_product/modules/authentication/controller/auth_controller.dart';
import 'package:my_own_product/modules/authentication/views/widgets/auth_appbar.dart';
import 'package:my_own_product/modules/authentication/views/widgets/auth_buttons.dart';

class IAmFromScreen extends StatelessWidget {
  IAmFromScreen({super.key});

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar(
        height: Get.height * 0.15,
        pageName: "I’m from",
        pageDescription: "Please choose the country from where you belong",
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
                hintText: 'Search country...',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey.shade100,

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
              ()=> ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: authController.filteredCountries.length,
                itemBuilder: (context, index) {
                  final country = authController.filteredCountries[index];

                  return Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: _CountryItem(
                      countryName: country['name']!,
                      flagEmoji: country['flag']!,
                      authController: authController,
                      onTap: () {
                        authController.selectedCountry.value = country['name']!;
                      },
                    ),
                  );
                },
              ),
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

/// Individual country item widget with flag and name
class _CountryItem extends StatelessWidget {
  final String countryName;
  final String flagEmoji;
  final AuthController authController;
  final VoidCallback onTap;

  const _CountryItem({
    required this.countryName,
    required this.flagEmoji,
    required this.authController,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Obx(
          () {
            final isSelected = authController.selectedCountry.value == countryName;
            return Row(
              children: [
                // Flag emoji in a circle
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade100,
                  ),
                  child: Center(
                    child: Text(
                      flagEmoji,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                // Country name
                Expanded(
                  child: CustomText(
                    text: countryName,
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                // Selection indicator
                if (isSelected)
                  Icon(
                    Icons.check_circle,
                    color: AppColors.buttonColor,
                    size: 24,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}