import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wellbeing_junction/read_data/user_data.dart';
import 'package:wellbeing_junction/screens/habit_builder_screen.dart';
import 'package:wellbeing_junction/screens/mood_tracker_screen.dart';
import 'package:wellbeing_junction/screens/self_assessment_quiz.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  int selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const MoodTracker(),
    const HabitBuilder(),
    QuizListScreen(),
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 213, 213, 100),
                Colors.purple.shade300
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            title: UserData(documentId: userDocId),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.settings),
                tooltip: 'Settings',
                onPressed: () {
                  // Navigate to settings screen or show settings overlay
                },
              ),
              IconButton(
                onPressed: () async {
                  await GoogleSignIn().signOut();
                  FirebaseAuth.instance.signOut();
                },
                icon: const Icon(Icons.logout),
              )
            ],
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
        ),
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
