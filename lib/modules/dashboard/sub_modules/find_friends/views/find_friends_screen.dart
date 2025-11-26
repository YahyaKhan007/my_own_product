import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_colors.dart';
import 'package:my_own_product/core/utils/custom_text.dart';
import 'package:my_own_product/modules/drawer/controller/drawer_controller.dart';

class FindFriendsScreen extends StatelessWidget {
  FindFriendsScreen({super.key});

  final drawerController = Get.find<AppDrawerController>();
  final int val = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: findFriendsAppBar(height: Get.height * 0.07),

      body: Column(
        children: [
          // this is for selection languages of whome you related you want to show suggestions
          languageSelectionSection(),

          SizedBox(height: 16),

          //   Showing User Section
          showingUserSection(),
        ],
      ).paddingSymmetric(horizontal: 16),
    );
  }

  // Appbar
  PreferredSize findFriendsAppBar({
    required double height,
    bool showBackButton = false,
  }) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: AppBar(
        leading: Visibility(
          visible: showBackButton,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          ),
        ),
        title: CustomText(
          text: 'Find Friends',
          textStyle: TextStyle(
            fontSize: 20,
            color: AppColors.buttonColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,

        actions: [
          InkWell(
            onTap: () {
              drawerController.toggleDrawer();
            },
            child: SizedBox(
              height: 18,

              child: SvgPicture.asset("assets/svg/drawer_menu_icon_svg.svg"),
            ).paddingOnly(right: 16),
          ),
        ],
      ),
    );
  }

  // this is for selection languages of whome you related you want to show suggestions
  Widget languageSelectionSection() {
    return SizedBox(
      height: 50,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: val,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return (index + 1 != val)
                    ? Center(
                        child: Container(
                          height: 32,
                          decoration: BoxDecoration(
                            color: AppColors.buttonColor.withValues(alpha: 0.4),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: CustomText(
                              text: 'English',
                              textStyle: TextStyle(fontSize: 12),
                            ).paddingSymmetric(horizontal: 12),
                          ),
                        ).paddingOnly(right: 8),
                      )
                    : Center(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: CustomText(
                                text: 'Add More',
                                textStyle: TextStyle(fontSize: 12),
                              ).paddingSymmetric(horizontal: 12),
                            ),
                          ).paddingOnly(right: 8),
                        ),
                      );
              },
            ),
          ),
          CustomText(
            text: 'you can add more languages to find more friends.',
            textStyle: TextStyle(fontSize: 10, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }

  Widget showingUserSection() {
    return Expanded(
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return findFriendsOption(imagePath: "", fieldText: "");
        },
      ),
    );
  }

  Widget findFriendsOption({
    required String imagePath,
    required String fieldText,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://i.pinimg.com/236x/4d/7d/fd/4d7dfdae8d25a2ca202c357cf4f0a732.jpg',
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'European User',
                      textStyle: TextStyle(
                        fontSize: 16,
                        // color: AppColors.buttonColor,
                      ),
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: 'Speaks : ',
                          textStyle: TextStyle(
                            fontSize: 12,
                            // color: AppColors.buttonColor,
                          ),
                        ),
                        CustomText(
                          text: 'Spanish',
                          textStyle: TextStyle(
                            fontSize: 12,
                            color: AppColors.buttonColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ).paddingSymmetric(horizontal: 8),
              ),
              SizedBox(
                height: 30,
                child: Center(child: Image.asset('assets/icons/handIcon.png')),
              ),
            ],
          ),
          SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: CustomText(
                  text: "Active Now",
                  textStyle: TextStyle(
                    fontSize: 10,
                    color: AppColors.buttonColor,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        text: "Responsive",
                        textStyle: TextStyle(
                          fontSize: 10,
                          // color: AppColors.buttonColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomText(
                        text: "Free to chat",
                        textStyle: TextStyle(
                          fontSize: 10,
                          // color: AppColors.buttonColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomText(
                        text: "Good learner",
                        textStyle: TextStyle(
                          fontSize: 10,
                          // color: AppColors.buttonColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ).paddingSymmetric(vertical: 16, horizontal: 16),
    ).paddingOnly(bottom: 8);
  }
}
