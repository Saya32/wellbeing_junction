//https://docs.flutter.dev/cookbook/design/drawer

import 'package:flutter/material.dart';
import 'package:wellbeing_junction/screens/habit_builder_screen.dart';
import 'package:wellbeing_junction/screens/mood_tracker_screen.dart';
import 'package:wellbeing_junction/screens/profile.dart';
import 'package:wellbeing_junction/screens/self_assessment_quiz.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const UserDataScreen(),
    const SelfAssessmentScreen(),
    const AdviceScreen(),
  ];

  void currentScreen(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          elevation: 0.0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 216, 90, 32),
                  Color.fromARGB(255, 244, 68, 68),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
      ),
      drawer: const Drawer(
        child: ProfilePage(),
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.mood),
            label: 'Insight',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            label: 'Self-Assessment ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: 'Extra Tips',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: currentScreen,
      ),
    );
  }
}
