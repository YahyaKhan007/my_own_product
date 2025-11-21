import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/modules/authentication/views/widgets/auth_appbar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: authAppBar(
        height: Get.height * 0.15,
        pageName: 'Chat Screen', pageDescription: ''),);
  }
}
