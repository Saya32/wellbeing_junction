import 'package:get/get.dart';
import 'package:wellbeing_junction/auth/auth_screen.dart';
import 'package:wellbeing_junction/screens/app_introduction_screen.dart';

class AppScreenRoutes {
  static List<GetPage> screens() => [
        GetPage(name: "/", page: () => const Authentication()),
        GetPage(name: "AppIntroductionScreen", page: () => const AppIntroductionScreen()),
        // GetPage(
        //   page: () => const AppIntroductionScreen(),
        //   name: AppIntroductionScreen.routeName,
        // ),
        // GetPage(
        //     page: () => const Dashboard(),
        //     name: Dashboard.routeName,
        //     binding: BindingsBuilder(() {
        //       Get.put(QuizPaperController());
        //       Get.put(MyDrawerController());
        //     })),
        // GetPage(page: () => const LoginScreen(), name: LoginScreen.routeName),
      ];
}
