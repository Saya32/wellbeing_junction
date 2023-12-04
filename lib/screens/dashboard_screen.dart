import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

void signOutUser() {
  FirebaseAuth.instance.signOut();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    //https://www.edureka.co/community/231021/how-do-i-set-background-image-in-flutter
    return Scaffold(
      appBar: AppBar(title: const Text("Mental Insight"), actions: const [
        IconButton(
          onPressed: signOutUser,
          icon: Icon(Icons.logout),
        )
      ]),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
