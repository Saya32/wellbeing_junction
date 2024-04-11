import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wellbeing_junction/firebase_questionnaire_collection/collections.dart';

// used the below resources to get help for implementation
// https://stackoverflow.com/questions/62865532/flutter-firebase-how-to-sign-in-users-with-google
//https://firebase.google.com/docs/auth/flutter/federated-auth

class AuthService {
  final user = Rxn<User>();

  Future<void> signInWithGoogle() async {
    // load new page
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    //request to get authentication details
    final GoogleSignInAuthentication googleAuthenctication =
        await googleUser!.authentication;

    //Add new credentials in database
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuthenctication.accessToken,
      idToken: googleAuthenctication.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    await saveUser(googleUser);
  }

  Future<void> saveUser(GoogleSignInAccount account) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      Map<String, dynamic> userData = {
        "email": account.email,
        "first name": account.displayName,
      };
      userCollection.doc(currentUser.uid).set(userData);
    }
  }

  bool isLogedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  User? getUser() {
    user.value = FirebaseAuth.instance.currentUser;
    return user.value;
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
  }
}
