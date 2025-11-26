import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_colors.dart';
import 'package:my_own_product/core/utils/custom_text.dart';

PreferredSize chatroomAppbar({
  required double appbarHeight,
  required VoidCallback onMenuPressed,
  bool showBackButton = false,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(appbarHeight),
    child: Column(
      children: [
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              onTap: () {},
              child: SizedBox(
                height: 28,
                width: 28,
                child: Visibility(
                  visible: showBackButton,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
            ),
            Spacer(),
            InkWell(
              onTap: onMenuPressed,
              child: SizedBox(
                height: 18,

                child: SvgPicture.asset("assets/svg/drawer_menu_icon_svg.svg"),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Hi Abdullah Fareed',
                    maxLines: 1,
                    textStyle: TextStyle(
                      color: AppColors.buttonColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomText(
                    text: 'You have received 20 Messages',
                    textStyle: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ],
              ).paddingOnly(right: 40),
            ),
            // SizedBox(
            //   width: 16,),
            Expanded(
              flex: 7,
              child: CustomText(
                text: 'Online',
                textStyle: TextStyle(
                  color: AppColors.buttonColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    ).paddingSymmetric(horizontal: 16),
  );
}
