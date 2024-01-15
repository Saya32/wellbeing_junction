import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserData extends StatelessWidget {
  final String documentId;
  UserData({required this.documentId});

  @override
  Widget build(BuildContext context) {
    // get the collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(), // providing the future here
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading..."); // Changed from CircularProgressIndicator
        } else if (snapshot.hasError) {
          return Text("No Name");
        } else if (snapshot.hasData && snapshot.data!.exists) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          // use your data for something
          return Text(data['first name']);
        } else {
          return Text("No name available"); // example usage of data
        }
// or some other placeholder
      },
    );
  }
}
