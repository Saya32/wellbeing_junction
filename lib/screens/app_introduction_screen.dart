//https://www.youtube.com/watch?v=SG2WNlQfqyc&t=607s&ab_channel=MitchKoko
//https://pub.dev/packages/smooth_page_indicator

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wellbeing_junction/elements/warning.dart';
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
              lastPage = (i == 4);
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
                    WarningText(),
                  ],
                ),
              ),
            ), // Warning Page
            Container(
              color: Color.fromARGB(255, 230, 148, 86),
              child: Image.asset(
                'assets/images/SmartSelect_20240326_150541.jpg',
                fit: BoxFit.contain,
              ),
            ), // First Introduction Page
            Container(
              color: Colors.orangeAccent,
              child: Image.asset(
                'assets/images/SmartSelect_20240326_150447.jpg',
                fit: BoxFit.contain,
              ),
            ), // Third Introduction Page
            Container(
              color: Color.fromARGB(255, 230, 148, 86),
              child: Image.asset(
                'assets/images/SmartSelect_20240326_150400.jpg',
                fit: BoxFit.contain,
              ),
            ), // Fourth Introduction Page
            Container(
              color: Colors.orangeAccent,
              child: Image.asset(
                'assets/images/SmartSelect_20240326_150523.jpg',
                fit: BoxFit.contain,
              ),
            ) // Fifth Introduction Page // fourth Introduction Pagee
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
                        pageController.jumpToPage(5);
                      },
                      child: const Text('Skip')),

                  //shows the state of the page
                  SmoothPageIndicator(controller: pageController, count: 5),

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
