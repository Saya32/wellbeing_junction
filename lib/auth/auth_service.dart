import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// https://stackoverflow.com/questions/62865532/flutter-firebase-how-to-sign-in-users-with-google
//https://firebase.google.com/docs/auth/flutter/federated-auth

class AuthService {
  signInWithGoogle() async {
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

    // Sign in into the app
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
