import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_own_product/core/data/app_colors.dart';
import 'package:my_own_product/core/utils/custom_text.dart';

/// Screen displaying all users from a selected country
class CountryUsersScreen extends StatelessWidget {
  const CountryUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get arguments passed from map screen
    final arguments = Get.arguments as Map<String, dynamic>?;
    final String country = arguments?['country'] ?? 'Unknown';
    final List<Map<String, dynamic>> users =
        arguments?['users'] as List<Map<String, dynamic>>? ?? [];

    // Get flag from first user
    final String flag = users.isNotEmpty ? users.first['flag'] as String : '🌍';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
        ),
        title: CustomText(
          text: '$flag $country',
          textStyle: TextStyle(
            fontSize: 20,
            color: AppColors.buttonColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: users.isEmpty
          ? Center(
              child: CustomText(
                text: 'No users found in $country',
                textStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
              ),
            )
          : Column(
              children: [
                // Header with user count
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.buttonColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.buttonColor.withOpacity(0.3),
                    ),
                  ),
                  child: CustomText(
                    text: '${users.length} user${users.length > 1 ? 's' : ''} from $country',
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // Users list
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return _buildUserCard(user);
                    },
                  ),
                ),
              ],
            ),
    );
  }

  /// Build a user card widget
  Widget _buildUserCard(Map<String, dynamic> user) {
    final String name = user['name'] as String? ?? 'Unknown';
    final String country = user['country'] as String? ?? '';
    final String flag = user['flag'] as String? ?? '👤';
    final String avatar = user['avatar'] as String? ?? '👤';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Avatar
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.buttonColor.withOpacity(0.2),
              child: Text(
                avatar,
                style: const TextStyle(fontSize: 32),
              ),
            ),
            const SizedBox(width: 16),
            // User info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: name,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        flag,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 4),
                      CustomText(
                        text: country,
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Action button
            IconButton(
              onPressed: () {
                // TODO: Navigate to user profile or start chat
                Get.snackbar(
                  'User',
                  'Viewing profile of $name',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: AppColors.buttonColor.withOpacity(0.8),
                  colorText: Colors.white,
                );
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: AppColors.buttonColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

