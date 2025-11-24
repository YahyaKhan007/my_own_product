import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_colors.dart';
import 'package:my_own_product/core/utils/custom_container.dart';
import 'package:my_own_product/modules/authentication/views/widgets/auth_appbar.dart';
import 'package:my_own_product/modules/dashboard/sub_modules/chat/views/widgets/message_appbar.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.buttonColor,
      appBar: messageAppBar(
        imagePath:  'https://i.pinimg.com/236x/4d/7d/fd/4d7dfdae8d25a2ca202c357cf4f0a732.jpg',
          height: Get.height * 0.12,
          backgroundColor: AppColors.buttonColor,
          pageNameTextColor: Colors.white,
          descriptionTextColor: Colors.white.withValues(alpha: 0.8),
          pageName: "Usama", pageDescription: "Online"),
      body: CustomContainer(
        borderRadius: 40,
        color: Colors.white,
      ),

    );
  }
}
