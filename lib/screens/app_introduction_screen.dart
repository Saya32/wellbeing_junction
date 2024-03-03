//https://www.youtube.com/watch?v=SG2WNlQfqyc&t=607s&ab_channel=MitchKoko
//https://pub.dev/packages/smooth_page_indicator

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wellbeing_junction/screens/dashboard_screen.dart';

class AppIntroductionScreen extends StatefulWidget {
  const AppIntroductionScreen({super.key});

  @override
  State<AppIntroductionScreen> createState() => _AppIntroductionScreenState();
}

class _AppIntroductionScreenState extends State<AppIntroductionScreen> {
  PageController pageController = PageController();

  // Check to see if we are on the last page
  bool lastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: pageController,
          onPageChanged: (i) {
            setState(() {
              lastPage = (i == 3);
            });
          },
          children: [
            Container(
              color: Colors.orangeAccent,
              child: const Center(
                child: Column(
                  mainAxisSize:
                      MainAxisSize.min, // To center the column itself.
                  children: [
                    Icon(Icons.warning_amber_rounded,
                        size: 60.0), // Big red warning sign
                    Text(
                      'This self-assessment quiz doesn\'t replace medical needs but to provide insight',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red, // Making the text red
                        fontSize: 20.0, // Big text
                      ),
                    ),
                  ],
                ),
              ),
            ), // Warning Page
            Container(color: Colors.amber), // First Introduction Page
            Container(
              color: const Color.fromARGB(255, 251, 150, 17),
            ), // Second Introduction Page
            Container(
              color: const Color.fromARGB(255, 233, 110, 17),
            ) // Third Introduction Page
          ],
        ),
        //smooth page swipe indicator
        Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Allows to skip the introduction
                  GestureDetector(
                      onTap: () {
                        pageController.jumpToPage(3);
                      },
                      child: const Text('Skip')),

                  //shows the state of the page
                  SmoothPageIndicator(controller: pageController, count: 4),

                  // Allows to naviagte to next page or be done if it's in ast page
                  lastPage //boolean that returns true or false value
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const Dashboard();
                            }));
                          },
                          child: const Text('Done'))
                      : GestureDetector(
                          onTap: () {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.bounceIn);
                          },
                          child: const Text('Next'))
                ]))
      ],
    ));
  }
}
