import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_quest_project/core/features/authentication/presentation/register_page.dart';
import 'package:uni_quest_project/core/features/services/api_service.dart';
import 'package:uni_quest_project/l10n/app_localizations.dart';
import '../../../constants/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _apiService = ApiService();

  final listOfImages = [
    "ask_ai_logo.png",
    "ask_ai_logo_1.png",
    "background_sign_up_page.png",
    "background_sign_up_page_2.png",
    "home_page.png",
    "login_or_sign_up.png",
    "logo_ask_ai.png",
    "logo_with_words.png",
    "register_page.png",
    "search_image_home_page.png",
    "splash_screen.png",
    "splash_screen_2.png",
    "splash_screen_3.png",
    "splash_screen_4.png",
  ];

  @override
  void dispose() {
    // Dispose controllers when not in use
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      // backgroundColor: AppColors.darkYellow,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/${listOfImages[13]}"),
              // 4 looks nice
              // 7 is okayish
              // 8 is better than 7
              // 10 needs to be adjusted
              // 11 aesthetically look nice tbh
              // 13 is better
              fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   AppLocalizations.of(context).yourJourneyToFindPerfectUniversity,
              //   style: const TextStyle(
              //       fontSize: 16,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.white),
              //   textAlign: TextAlign.center,
              // ),
              // Image.asset("assets/images/splash_screen.png"),
              SizedBox(height: height / 25),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: AppLocalizations.of(context).email,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: height / 40),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: AppLocalizations.of(context).password,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                obscureText: true,
              ),
              SizedBox(height: height / 40),
              GestureDetector(
                onTap: () {
                  // Handle forgot password
                },
                child: Text(
                  AppLocalizations.of(context).forgotPassword,
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              SizedBox(height: height / 40),
              ElevatedButton(
                onPressed: () async {
                  final email = emailController.text;
                  final password = passwordController.text;
                  print("username : $email");
                  print("password : $password");
                  final result = await _apiService.loginStudent(
                      email: email, password: password);
                  print("result : $result");
                  if (result) {
                    // Save login credentials to SharedPreferences
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setString('email', email);
                    await prefs.setString('password', password);

                    // Redirect to home page
                    context.goNamed(RouteNames.homePage);
                  } else {
                    // Show error message (e.g., using a snackbar)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text(AppLocalizations.of(context).loginFailed)),
                    );
                  }
                },
                child: Text(AppLocalizations.of(context).login),
              ),
              SizedBox(height: height / 80),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const RegisterPage()), // Directly pushing the page widget
                  );
                },
                child: Text(AppLocalizations.of(context).signUp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
