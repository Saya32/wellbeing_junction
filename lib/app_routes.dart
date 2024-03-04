import 'package:get/get.dart';
import 'package:wellbeing_junction/auth/auth_screen.dart';
import 'package:wellbeing_junction/controllers/questionnaire/questionnaire_controller.dart';
import 'package:wellbeing_junction/screens/app_introduction_screen.dart';
import 'package:wellbeing_junction/screens/self_assessment_quiz.dart';

class AppScreenRoutes {
  static List<GetPage> screens() => [
        GetPage(name: "/", page: () => const Authentication()),
        GetPage(
          name: "AppIntroductionScreen",
          page: () => const AppIntroductionScreen(),
        ),
        GetPage(
            name: "/selfAssesmentScreen",
            page: () => const SelfAssessmentScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuizPaperController());
            }))
        // GetPage(page: () => const LoginScreen(), name: LoginScreen.routeName),
      ];
}
