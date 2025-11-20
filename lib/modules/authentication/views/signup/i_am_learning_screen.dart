import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/modules/authentication/views/widgets/auth_appbar.dart';

class IAmLearningScreen extends StatelessWidget {
  const IAmLearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar(
        height: Get.height * 0.15,
        pageName: "I’m learning",
        pageDescription: "Please select all the languages you are interested to learn",
      ),
    );
  }
}
