import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_quest_project/core/constants/routes.dart';
import 'package:uni_quest_project/core/features/admission_percent_calculator/presentation/admission_percent_calculator_screen.dart';
import 'package:uni_quest_project/core/features/authentication/presentation/login_page.dart';
import 'package:uni_quest_project/core/features/find_university/presentation/gmat_page.dart';
import 'package:uni_quest_project/core/features/find_university/presentation/gre_page.dart';
import 'package:uni_quest_project/core/features/find_university/presentation/ielts_page.dart';
import 'package:uni_quest_project/core/features/settings/presentation/logout_page.dart';
import 'package:uni_quest_project/core/features/find_university/presentation/preferred_location.dart';
import 'package:uni_quest_project/core/features/settings/presentation/profile_page.dart';
import 'package:uni_quest_project/core/features/find_university/presentation/questionnaire_page.dart';
import 'package:uni_quest_project/core/features/authentication/presentation/register_page.dart';
import 'package:uni_quest_project/core/features/find_university/presentation/toefl_page.dart';
import 'package:uni_quest_project/core/features/settings/presentation/update_info_page.dart';
import '../features/home/presentation/history_page.dart';
import '../features/home/presentation/home_page.dart';
import '../features/find_university/presentation/search_universities.dart';
import '../features/wish_list_page/Presentation/wish_list_page.dart';

// GoRouter configuration
class Routing {
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      // --Login Screen
      // GoRoute(
      //   path: '/',
      //   name: RouteNames.loginPage,
      //   builder: (context, state) => const LoginPage(),
      // ),
      GoRoute(
        path: '/',
        name: RouteNames.preferredLocation,
        builder: (context, state) => const PreferredLocation(),
      ),
      // Home Page
      // GoRoute(
      //   path: '/home_page',
      //   name: RouteNames.homePage,
      //   builder: (context, state) => const HomePage(),
      // ),
      // GoRoute(
      //   path: '/home_page',
      //   name: RouteNames.wishListPage,
      //   builder: (context, state) => const WishlistPage(),
      // ),
      GoRoute(
        path: '/register_page',
        name: RouteNames.registerPage,
        builder: (context, state) => const RegisterPage(),
      ),
      // Wishlisted Universities Screen
      GoRoute(
        path: '/wishlisted_universities_page',
        name: RouteNames.searchedUniversities,
        builder: (context, state) => const SearchedUniversities(),
      ),
      GoRoute(
        path: '/ielts_page',
        name: RouteNames.ieltsPage,
        builder: (context, state) => const IeltsPage(),
      ),
      GoRoute(
        path: '/toefl_page',
        name: RouteNames.toeflPage,
        builder: (context, state) => const ToeflPage(),
      ),
      // GoRoute(
      //   path: '/gre_page',
      //   name: RouteNames.grePage,
      //   builder: (context, state) => const GrePage(),
      // ),
      GoRoute(
        path: '/gmat_page',
        name: RouteNames.gmatPage,
        builder: (context, state) => const GmatPage(),
      ),
      GoRoute(
        path: '/questionnaire_page',
        name: RouteNames.questionnairePage,
        builder: (context, state) => const QuestionnairePage(),
      ),
      // GoRoute(
      //   path: '/preferred_location',
      //   name: RouteNames.preferredLocation,
      //   builder: (context, state) => const PreferredLocation(),
      // ),
      GoRoute(
        path: '/profile_page',
        name: RouteNames.profilePage,
        builder: (context, state) => const ProfilePage(),
      ),
      // GoRoute(
      //
      //   path: '/admission_percent_calculator_page',
      //   name: RouteNames.admissionPercentCalculatorPage,
      //   builder: (context, state) => const AdmissionPercentCalculatorPage(),
      // ),
      GoRoute(
        path: '/update_info_page',
        name: RouteNames.updateInfoPage,
        builder: (context, state) => const UpdateInfoPage(),
      ),
      GoRoute(
        path: '/logout_page',
        name: RouteNames.logoutPage,
        builder: (context, state) => const LogoutPage(),
      ),
      // GoRoute(
      //   path: '/histroy_page',
      //   name: RouteNames.historyPage,
      //   builder: (context, state) => const HistoryPage(),
      // ),
    ],
    // errorPageBuilder: (context, state) {
    //   return const MaterialPage(child: ErrorPage());
    // },
    redirect: (context, state) async {
      // Perform the redirection based on the user's login status
      final isLoggedIn = await isUserLoggedIn();
      if (isLoggedIn && state.uri.toString() == '/') {
        return '/home_page';
      } else if (!isLoggedIn && state.uri.toString() != '/') {
        return '/';
      }
      return null;
    },
  );
}






Future<bool> isUserLoggedIn() async {
  final prefs = await SharedPreferences.getInstance();
  String? email = prefs.getString('email');
  String? password = prefs.getString('password');
  print("email : $email");
  print("password : $password");
  return email != null && password != null;
}

// Save login state
Future<void> setLoginState(bool isLoggedIn) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('is_logged_in', isLoggedIn);
}
