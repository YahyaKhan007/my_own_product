import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_colors.dart';
import 'package:my_own_product/core/utils/custom_text.dart';

PreferredSize messageAppBar({
  double? height,
  required String pageName,
  required String pageDescription,
  Color? backgroundColor,
  Color? iconColor,
  Color? pageNameTextColor,
  Color? descriptionTextColor,
  required String imagePath
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(height ?? 48),
    child: Container(
      color: backgroundColor ?? Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 32),
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: iconColor ?? Colors.black,
              size: 16,
            ),
          ),
          SizedBox(height: 6),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: pageName,
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: pageNameTextColor ?? AppColors.buttonColor,
                      ),
                    ),
                    CustomText(
                      text: pageDescription,
                      textStyle: TextStyle(
                        fontSize: 14,
                        color: descriptionTextColor ?? Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              CircleAvatar(
               radius: 31,
                backgroundColor: Colors.black.withValues(alpha: 0.5),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(imagePath),
                ),
              )

            ],
          ),

        ],
      ).paddingSymmetric(horizontal: 16),
    ),
  );
}
