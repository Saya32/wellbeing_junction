import 'package:get/get.dart';
import 'package:wellbeing_junction/auth/auth_service.dart';
import 'package:wellbeing_junction/controllers/questionnaire/questionnaire_controller.dart';
import 'package:wellbeing_junction/controllers/questionnaire/questions_controller.dart';
import 'package:wellbeing_junction/controllers/profile_screen.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthService(), permanent: true);
    Get.put(QuizPaperController());
    Get.put(ProfileScreenController());
   // Get.put(QuestionController());
  }
}
