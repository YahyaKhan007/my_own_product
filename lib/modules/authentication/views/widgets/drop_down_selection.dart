import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/themes/controller/theme_controller.dart';
import 'package:my_own_product/core/utils/custom_container.dart';
import 'package:my_own_product/core/utils/custom_text.dart';

Future<String> dropDownSelection({
  required BuildContext context,
  required List<String> options,
  required String type,
}) async {
  final ThemeController themeController = Get.find();
  RxList<String> listOptions = options.obs;
  TextEditingController searchController = TextEditingController();
  String selectedValue = '';
  await showModalBottomSheet(
    backgroundColor:
        themeController.selectedThemeData.value.colorScheme.secondary,
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 16),
            CustomContainer(
              height: 52,
              borderRadius: 16,
              width: double.infinity,
              color: themeController
                  .selectedThemeData
                  .value
                  .scaffoldBackgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      minLines: 1,
                      onChanged: (value) {
                        listOptions.value = options
                            .where(
                              (option) => option.toLowerCase().contains(
                                value.toLowerCase(),
                              ),
                            )
                            .toList();
                      },
                      controller: searchController,
                      cursorColor: themeController
                          .selectedThemeData
                          .value
                          .iconTheme
                          .color,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "search",
                        hintStyle: themeController
                            .selectedThemeData
                            .value
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                              color: themeController
                                  .selectedThemeData
                                  .value
                                  .iconTheme
                                  .color,
                            ),
                        suffixIcon: Icon(
                          Icons.search,
                          color: themeController
                              .selectedThemeData
                              .value
                              .dividerColor,
                        ).paddingOnly(bottom: 6),
                      ),
                    ).paddingOnly(left: 16, right: 16, top: 6),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: listOptions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: CustomText(
                        text: listOptions[index],
                        textStyle: themeController
                            .selectedThemeData
                            .value
                            .textTheme
                            .bodyMedium,
                      ),
                      onTap: () {
                        switch (type) {
                          case 'gender':
                            selectedValue = listOptions[index];

                            break;

                          default:
                            break;
                        }

                        Get.back(); // Close the dropdown
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
  return selectedValue;
}
