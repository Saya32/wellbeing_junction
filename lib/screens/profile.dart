import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbeing_junction/controllers/profile_screen.dart';
import 'package:wellbeing_junction/screens/forgot_password_screen.dart';

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
      body: GetBuilder<ProfileScreenController>(
        builder: (profileController) {
          final currentUser = profileController.user.value;
          if (currentUser != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Name: ${currentUser.displayName ?? profileController.firstName.value}',
                  ),
                  Text('Email: ${currentUser.email ?? 'guest@gmail.com'}'),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.password),
                    label: const Text('Change Password'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const ForgetPassword();
                          },
                        ),
                      );
                    },
                  ),
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
        },
      ),
    );
  }
}
