import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_colors.dart';
import 'package:my_own_product/core/themes/controller/theme_controller.dart';

Future<DateTime?> dateSelection({required BuildContext context,

required Rx<DateTime> initialDate
}) async {
  final ThemeController themeController = Get.find();

  // Use Flutter's built-in showDatePicker with custom theme
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: initialDate.value,
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
    builder: (context, child) {
      return Theme(
        data: themeController.selectedThemeData.value.copyWith(
          colorScheme:
          themeController.selectedThemeData.value.colorScheme
              .copyWith(
          primary:   AppColors.buttonColor,
                // primary: themeController
                //     .selectedThemeData
                //     .value
                //     .colorScheme
                //     .onPrimary,
                onPrimary:
                    themeController.selectedThemeData.value.colorScheme.primary,
                surface:
                    AppColors.buttonColor,
                    // themeController.selectedThemeData.value.colorScheme.primary,
                onSurface: themeController
                    .selectedThemeData
                    .value
                    .colorScheme
                    .onPrimary,
              ),
          // Customize text selection theme for the text field
          textSelectionTheme: TextSelectionThemeData(
            cursorColor:
                themeController.selectedThemeData.value.colorScheme.onPrimary,
            selectionColor: themeController
                .selectedThemeData
                .value
                .colorScheme
                .onPrimary
                .withValues(alpha: 0.3),
            selectionHandleColor:
                themeController.selectedThemeData.value.colorScheme.onPrimary,
          ),
        ),
        child: child!,
      );
    },
  );

  // If a date was selected, validate age and update controller
  if (picked != null) {
    final now = DateTime.now();
    final age =
        now.year -
        picked.year -
        ((now.month < picked.month ||
                (now.month == picked.month && now.day < picked.day))
            ? 1
            : 0);


return picked;

  }
  else {
    return null;
  }
}
