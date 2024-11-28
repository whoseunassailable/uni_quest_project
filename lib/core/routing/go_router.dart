import 'package:go_router/go_router.dart';
import '../features/presentation/login_page.dart';
import '../features/presentation/sign_up_page.dart'; // Add the appropriate imports for the other screens
import '../features/presentation/home_page.dart';
import '../features/presentation/wishlisted_universities_page.dart';

// GoRouter configuration
final _router = GoRouter(
  routes: [
    // Login Screen
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(
        title: 'Flutter Project',
      ),
    ),
    // Sign Up Screen
    GoRoute(
      path: '/register',
      builder: (context, state) => const SignUpPage(),
    ),
    // Home Page
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    // Wishlisted Universities Screen
    GoRoute(
      path: '/wishlisted',
      builder: (context, state) => const WishlistedUniversitiesPage(),
    ),
  ],
);
