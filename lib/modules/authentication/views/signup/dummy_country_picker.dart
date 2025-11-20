import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_colors.dart';
import 'package:my_own_product/core/data/app_strings.dart';
import 'package:my_own_product/core/utils/custom_text.dart';
import 'package:my_own_product/modules/authentication/views/widgets/auth_appbar.dart';
import 'package:my_own_product/modules/authentication/views/widgets/auth_buttons.dart';

/// Country picker screen for selecting user's country of origin
/// 
/// Displays a list of countries with flag emojis and allows selection.
/// Matches the design specification with header, country list, and Done button.
class DummyCountryPicker extends StatefulWidget {
  const DummyCountryPicker({super.key});

  @override
  State<DummyCountryPicker> createState() => _DummyCountryPickerState();
}

class _DummyCountryPickerState extends State<DummyCountryPicker> {
  String? selectedCountry;
  String searchQuery = '';

  // Complete list of all countries in the world with their flag emojis
  // Get filtered countries based on search query
  List<Map<String, String>> get filteredCountries {
    if (searchQuery.isEmpty) {
      return AppStrings.allCountries;
    }
    return AppStrings.allCountries
        .where((country) =>
            country['name']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: authAppBar(
        height: Get.height * 0.15,
        pageName: "I'm from",
        pageDescription: "Please choose the country from where you belong",
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search country...',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: filteredCountries.length,
              itemBuilder: (context, index) {
                final country = filteredCountries[index];
                final isSelected = selectedCountry == country['name'];
                
                return Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: _CountryItem(
                    countryName: country['name']!,
                    flagEmoji: country['flag']!,
                    isSelected: isSelected,
                    onTap: () {
                      setState(() {
                        selectedCountry = country['name'];
                      });
                    },
                  ),
                );
              },
            ),
          ),
          // Done button at the bottom
          Container(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            child: CustomButton(
              color: AppColors.buttonColor,
              borderRadius: 16,
              isExpanded: true,
              onTap: () {
                if (selectedCountry != null) {
                  // Handle selection - you can navigate back or save the selection
                  Get.back(result: selectedCountry);
                }
              },
              child: CustomText(
                text: 'Done',
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Individual country item widget with flag and name
class _CountryItem extends StatelessWidget {
  final String countryName;
  final String flagEmoji;
  final bool isSelected;
  final VoidCallback onTap;

  const _CountryItem({
    required this.countryName,
    required this.flagEmoji,
    required this.isSelected,
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
        child: Row(
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
            // Selection indicator (optional)
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: AppColors.buttonColor,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}

