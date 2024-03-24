import 'package:get/get.dart';
import 'package:wellbeing_junction/auth/auth_screen.dart';
import 'package:wellbeing_junction/auth/welcome_screen.dart';
import 'package:wellbeing_junction/controllers/questionnaire/questionnaire_controller.dart';
import 'package:wellbeing_junction/controllers/questionnaire/questions_controller.dart';
import 'package:wellbeing_junction/screens/advice.dart';
import 'package:wellbeing_junction/screens/app_introduction_screen.dart';
import 'package:wellbeing_junction/screens/dashboard_screen.dart';
import 'package:wellbeing_junction/screens/insight.dart';
import 'package:wellbeing_junction/screens/quiz_detail_scree.dart';
import 'package:wellbeing_junction/screens/self_assessment_quiz.dart';

import 'screens/result_screen.dart';

class AppScreenRoutes {
  static List<GetPage> screens() => [
        GetPage(name: "/", page: () => const Authentication()),
        GetPage(
          name: "/AppIntroductionScreen",
          page: () => const AppIntroductionScreen(),
        ),
        GetPage(
            name: "/selfAssesmentScreen",
            page: () => const SelfAssessmentScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuizPaperController());
              Get.put(QuestionController());
            })),
        GetPage(page: () => const Authentication(), name: "/Authentication"),
        GetPage(page: () => const WelcomePage(), name: "/WelcomePage"),
        GetPage(
          name: QuizDetailsScreen.routeName,
          page: () => const QuizDetailsScreen(),
          binding: BindingsBuilder(() {
            Get.put<QuestionController>(QuestionController());
          }),
        ),
        GetPage(
          name: ResultScreen.routeName,
          page: () => const ResultScreen(),
        ),
        GetPage(
          name: Dashboard.routeName,
          page: () => const Dashboard(),
        ),
        GetPage(
          name: AdviceScreen.routeName,
          page: () => const AdviceScreen(),
        ),
      ];
}
