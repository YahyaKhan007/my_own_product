import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_colors.dart';
import 'package:my_own_product/core/routes/app_routes.dart';
import 'package:my_own_product/core/utils/custom_text.dart';
import 'package:my_own_product/modules/dashboard/sub_modules/chat/views/widgets/chat_room_appbar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chatroomAppbar(appbarHeight: Get.height * 0.14),
      body: Column(
        children: [
          // Stories Section
          storiesSection(),

          //   Messages Section
          messagesSection(),
        ],
      ),
    );
  }

  Widget messagesSection() {
    return Expanded(
      child: ListView.separated(
        itemCount: 12,
        itemBuilder: (context, index) {
          return messageOption(
            onTap: (){
              Get.toNamed(AppRoutes.messageScreen.name);
            },
            name: 'User X',
            lastMessage: 'hey! this is my last message',
            imagePath:
                'https://i.pinimg.com/236x/4d/7d/fd/4d7dfdae8d25a2ca202c357cf4f0a732.jpg',
          );
        },
        separatorBuilder: (context, index) {
          return Divider(color: Colors.grey.withValues(alpha: 0.1),).paddingOnly(left: Get.width * 0.2, right: 16);
        }
      ),
    );
  }

  Widget messageOption({
    required String name,
    required String imagePath,
    required String lastMessage,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      height: 60,
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          radius: 28,
          backgroundImage: NetworkImage(imagePath),
        ),
        title: CustomText(text: name, textStyle: TextStyle(fontSize: 13)),
        subtitle: CustomText(
          text: lastMessage,
          textStyle: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        trailing: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
          CustomText(text: '10:00',textStyle: TextStyle(fontSize: 12, color: Colors.grey),),
          CircleAvatar(radius: 10,

          backgroundColor: AppColors.buttonColor.withValues(alpha: 0.5),
            child: Center(child: CustomText(text: '4', textStyle: TextStyle(color: Colors.black, fontSize: 10),),),
          )


        ],),
      ),
    );
  }

  Widget storiesSection() {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 12,
        itemBuilder: (context, index) {
          return storyOption(
            imagePath:
                'https://i.pinimg.com/236x/4d/7d/fd/4d7dfdae8d25a2ca202c357cf4f0a732.jpg',
            name: 'Hassan',
          );
        },
      ),
    ).paddingOnly(left: 16);
  }

  Widget storyOption({required String name, required String imagePath}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.buttonColor,
          child: CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(imagePath),
          ),
        ),
        CustomText(
          text: name.split(' ')[0],
          textStyle: TextStyle(color: Colors.black, fontSize: 13),
        ),
      ],
    ).paddingOnly(right: 16);
  }
}
