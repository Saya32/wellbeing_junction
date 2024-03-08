import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wellbeing_junction/auth/auth_service.dart';

import '../auth/auth_screen.dart';
import '../firebase_questionnaire_collection/collections.dart';
// https://pub.dev/packages/url_launcher

class ProfileScreenController extends GetxController {
  Rxn<User?> user = Rxn();
  Rx<String> firstName = Rx('');

  @override
  void onReady() {
    user.value = Get.find<AuthService>().getUser();
    if (user.value != null) {
      fetchFirstName();
    }
    super.onReady();
  }

  void signOut() async {
    await Get.find<AuthService>().signOut();
    await FirebaseAuth.instance.signOut();
    Get.to(() => Authentication());
  }

  void sendEmail() async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'sayakabhandari@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Mental Insight Query',
      }),
    );
    launchUrl(emailLaunchUri.toString());
  }

  Future<void> launchUrl(String url) async {
    if (!await launch(url)) {
      throw 'The email could not launch';
    }
  }

  void fetchFirstName() async {
    final userId = user.value!.uid;
    final doc = await userCollection.doc(userId).get();
    if (doc.exists) {
      firstName.value = doc.data()?['first name'] ?? '';
    }
  }
}
