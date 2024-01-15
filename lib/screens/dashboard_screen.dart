import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wellbeing_junction/elements/button.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(currentUser.email!),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () {
              // Navigate to settings screen or show settings overlay
            },
          ),
          IconButton(
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
