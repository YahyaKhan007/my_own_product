import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/modules/authentication/views/widgets/auth_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: authAppBar(
        height: Get.height * 0.15,
        pageName: 'Profile Screen', pageDescription: ''),);
  }
}
