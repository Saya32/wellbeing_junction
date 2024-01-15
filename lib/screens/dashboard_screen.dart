import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wellbeing_junction/elements/button.dart';
import 'package:wellbeing_junction/read_data/user_data.dart';
import 'package:wellbeing_junction/screens/habit_builder_screen.dart';
import 'package:wellbeing_junction/screens/mood_tracker_screen.dart';
import 'package:wellbeing_junction/screens/self_assessment_quiz.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

void signOutUser() {
  // Sign out the user
  FirebaseAuth.instance.signOut();
}

class _DashboardState extends State<Dashboard> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  //Document Ids from firebase
  List<String> documentIds = [];

  Future getDocIds() async {
    // Get users from the firebase
    // Future means takes time to load up the widget
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              print(element.reference);
              documentIds.add(element.reference.id);
            }));
  }

  @override
  void initState() {
    getDocIds();
    super.initState();
  }

  int selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const MoodTracker(),
    const HabitBuilder(),
    const SelfAssessmentQuiz(),
  ];

  void currentScreen(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String userDocId = currentUser.uid;

    return Scaffold(
      appBar: AppBar(
        title: UserData(documentId: userDocId),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () {
              // Navigate to settings screen or show settings overlay
            },
          ),
          const IconButton(
            onPressed: signOutUser,
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.mood),
            label: 'Mood Tracker',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            label: 'Habit Builder',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: 'Self Assessment',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: currentScreen,
      ),
    );
  }
}
