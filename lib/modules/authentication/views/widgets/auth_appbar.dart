import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_colors.dart';
import 'package:my_own_product/core/utils/custom_text.dart';

PreferredSize authAppBar({double? height, required String pageName, required String pageDescription}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(height??48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 32,),
        InkWell(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20,)),
        SizedBox(height: 8,),

        CustomText(
          text: pageName,
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.buttonColor),
        ),
        CustomText(
          text: pageDescription,
          textStyle: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    ).paddingSymmetric(horizontal:16),
  );
}
