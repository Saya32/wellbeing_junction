import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbeing_junction/screens/profile_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileScreenController profileController =
        Get.find<ProfileScreenController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Obx(() {
        if (profileController.user.value != null) {
          final currentUser = profileController.user.value!;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Name: ${currentUser.displayName ?? profileController.firstName.value}'),
                Text('Email: ${currentUser.email ?? 'guest@gmail.com'}'),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  icon: const Icon(Icons.email),
                  label: const Text('Contact Support'),
                  onPressed: () => profileController.sendEmail(),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  icon: const Icon(Icons.logout),
                  label: const Text('Sign Out'),
                  onPressed: () => profileController.signOut(),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text('No user is currently signed in.'),
          );
        }
      }),
    );
  }
}
