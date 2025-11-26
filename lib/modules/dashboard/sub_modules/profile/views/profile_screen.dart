import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_colors.dart';
import 'package:my_own_product/core/utils/base_scaffold.dart';
import 'package:my_own_product/core/utils/custom_text.dart';
import 'package:my_own_product/modules/drawer/controller/drawer_controller.dart';

class CurrentProfileScreen extends StatelessWidget {
  CurrentProfileScreen({super.key});

  final AppDrawerController drawerController = Get.find<AppDrawerController>();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: profileScreenAppbar(),
      body: Column(
        children: [
          //   TOP PROFILE SECTION
          topProfileSection(),
          SizedBox(height: 16),

          // Profile Data Section
          profileDataSection(),
        ],
      ),
    );
  }

  Widget profileDataSection() {
    return Column(
      children: [
        profileDataStreakSection(),

        SizedBox(height: 16),
        // This is responsible for showing insights
        insightSection(),
        SizedBox(height: 16),

        Container(
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            children: [
              CustomText(
                text: 'Invite Friends',
                textStyle: TextStyle(
                  fontSize: 14,
                  color: AppColors.buttonColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              CustomText(
                text: 'Share the link with your friends',
                textStyle: TextStyle(fontSize: 14, color: Colors.black),
              ),
              SizedBox(height: 8),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.buttonColor.withValues(alpha: 0.5),
                ),

                // width: double.infinity,
                // height: 48,
                child: CustomText(
                  text: 'Share',
                ).paddingSymmetric(horizontal: 40, vertical: 8),
              ).paddingSymmetric(horizontal: 32),
            ],
          ).paddingSymmetric(vertical: 16),
        ),
      ],
    ).paddingSymmetric(horizontal: 16);
  }

  Widget insightSection() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: '${0} Points,  Joined for ${1} Day',
            textStyle: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              insightOption(value: 0, insightTitle: 'Translations'),
              SizedBox(width: 8),

              insightOption(value: 0, insightTitle: 'Tapped words'),

              SizedBox(width: 8),
              insightOption(value: 0, insightTitle: 'Correction'),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              insightOption(value: 0, insightTitle: 'Transcription'),
              SizedBox(width: 8),

              insightOption(value: 0, insightTitle: 'Pronunciation'),
              SizedBox(width: 8),
              insightOption(value: 0, insightTitle: 'Exchange'),
            ],
          ),
        ],
      ).paddingSymmetric(vertical: 16, horizontal: 16),
    );
  }

  Widget insightOption({required int value, required String insightTitle}) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          children: [
            Center(
              child: CustomText(
                text: value.toString(),
                textStyle: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ),
            CustomText(
              text: insightTitle,
              textStyle: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ],
        ).paddingSymmetric(vertical: 8),
      ),
    );
  }

  Widget profileDataStreakSection() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: '1 Day Streak',
            textStyle: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              streakDayOption(isComplete: true, dayNo: 1),
              streakDayOption(isComplete: false, dayNo: 2),
              streakDayOption(isComplete: false, dayNo: 3),
              streakDayOption(isComplete: false, dayNo: 4),
              streakDayOption(isComplete: false, dayNo: 5),
              streakDayOption(isComplete: false, dayNo: 6),
              streakDayOption(isComplete: false, dayNo: 7),
            ],
          ).paddingSymmetric(),
        ],
      ).paddingSymmetric(vertical: 16, horizontal: 16),
    );
  }

  Widget streakDayOption({required bool isComplete, required int dayNo}) {
    return Expanded(
      child: CircleAvatar(
        radius: 12,
        backgroundColor: AppColors.buttonColor,
        child: CircleAvatar(
          radius: 11,
          backgroundColor: isComplete ? AppColors.buttonColor : Colors.white,
          child: Center(
            child: Icon(
              dayNo == 7 ? Icons.wine_bar_sharp : Icons.check,
              size: 16,
              color: !isComplete ? AppColors.buttonColor : Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget topProfileSection() {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.buttonColor.withValues(alpha: 0.3),
              backgroundImage: NetworkImage(
                'https://i.pinimg.com/236x/4d/7d/fd/4d7dfdae8d25a2ca202c357cf4f0a732.jpg',
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Guest User'),

                  CustomText(
                    text: 'Guest User',
                    textStyle: TextStyle(
                      color: AppColors.buttonColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            momentData(value: 0, momentType: 'Moments'),
            momentData(value: 0, momentType: 'Following'),
            momentData(value: 0, momentType: 'Followers'),
            momentData(value: 0, momentType: 'Visitors'),
          ],
        ),
      ],
    ).paddingSymmetric(horizontal: 16);
  }

  Widget momentData({required int value, required String momentType}) {
    return Expanded(
      child: Column(
        children: [
          CustomText(
            text: value.toString(),
            textStyle: TextStyle(fontSize: 12, color: Colors.black),
          ),
          CustomText(
            text: momentType,
            textStyle: TextStyle(fontSize: 12, color: Colors.black),
          ),
        ],
      ),
    );
  }

  PreferredSize profileScreenAppbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(40),

      child: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share, color: Colors.black, size: 20),
          ),
          IconButton(
            onPressed: () {
              drawerController.toggleDrawer();
            },
            icon: Icon(Icons.settings, color: Colors.black, size: 20),
          ),
        ],
      ),
    );
  }
}
