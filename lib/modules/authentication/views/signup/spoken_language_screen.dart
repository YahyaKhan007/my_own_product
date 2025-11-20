import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/modules/authentication/views/widgets/auth_appbar.dart';

class SpokenLanguageScreen extends StatelessWidget {
  final bool isNative;
  const SpokenLanguageScreen({super.key, this.isNative = false});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: authAppBar(
        height: Get.height * 0.15,
        pageName: isNative ? "Native language" : "Spoken Languages",
        pageDescription: isNative
            ? "Please select your native language"
            : "Please select all the languages which you can speak",
      ),
    );
  }
}
