import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserData extends StatelessWidget {
  final String documentId;
  const UserData({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    // get the collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(), // providing the future here
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading..."); // Changed from CircularProgressIndicator
        } else if (snapshot.hasError) {
          return const Text("No Name");
        } else if (snapshot.hasData && snapshot.data!.exists) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          // use your data for something
          return Text(data['first name']);
        } else {
          return Text(FirebaseAuth
              .instance.currentUser!.displayName!); // example usage of data
        }
// or some other placeholder
      },
    );
  }
}
