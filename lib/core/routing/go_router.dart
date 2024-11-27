import 'package:go_router/go_router.dart';
import '../features/presentation/login_page.dart';

// GoRouter configuration
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(title: 'Flutter Project',),
    ),
  ],
);