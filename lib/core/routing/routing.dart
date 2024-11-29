import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_quest_project/core/constants/routes.dart';
import '../features/presentation/error_page.dart';
import '../features/presentation/login_page.dart';
import '../features/presentation/sign_up_page.dart';
import '../features/presentation/home_page.dart';
import '../features/presentation/wishlisted_universities_page.dart';

// GoRouter configuration
class Routing {
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      // Login Screen
      GoRoute(
        path: '/',
        name: RouteNames.loginPage,
        builder: (context, state) => const LoginPage(
          title: 'Flutter Project',
        ),
      ),
      // Sign Up Screen
      GoRoute(
        path: '/sign_up_page',
        name: RouteNames.signUpPage,
        builder: (context, state) => const SignUpPage(),
      ),
      // Home Page
      GoRoute(
        path: '/home_page',
        name: RouteNames.homePage,
        builder: (context, state) => const HomePage(),
      ),
      // Wishlisted Universities Screen
      GoRoute(
        path: '/wishlisted_universities_page',
        name: RouteNames.wishlistedUniversities,
        builder: (context, state) => const WishlistedUniversitiesPage(),
      ),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(child: ErrorPage());
    },
  );
}
