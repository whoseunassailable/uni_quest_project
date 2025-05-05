import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_quest_project/core/constants/app_font_size.dart';
import 'package:uni_quest_project/core/features/authentication/presentation/register_page.dart';
import 'package:uni_quest_project/core/features/services/api_service.dart';
import 'package:uni_quest_project/l10n/app_localizations.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/display_snackbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _apiService = ApiService();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.darkYellow,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Replaced the existing image with a new relevant image
            Image.asset(
              height: height * 0.125,
              "assets/images/book_movie_recommendation.png",  // Update with your new image path
            ),
            SizedBox(height: height / 25),
            Column(
              children: [
                Text(
                  AppLocalizations.of(context).welcomeBack,
                  style: TextStyle(
                      fontSize: height * AppFontSize.m, color: Colors.black),
                ),
                Text(
                  AppLocalizations.of(context).loginToYourAccount,
                  style: TextStyle(
                    fontSize: height * AppFontSize.xxs,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 25),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: AppLocalizations.of(context).email,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(height: height / 40),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: AppLocalizations.of(context).password,
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
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
                style: TextStyle(color: Colors.black),
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
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('email', email);
                  await prefs.setString('password', password);

                  context.goNamed(RouteNames.homePage);
                } else {
                  final displaySnackbar = DisplaySnackbar();
                  displaySnackbar.showErrorWithoutFocus(
                    context: context,
                    message: AppLocalizations.of(context).loginFailed,
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
                      const RegisterPage()),
                );
              },
              child: Text(AppLocalizations.of(context).signUp),
            ),
          ],
        ),
      ),
    );
  }
}
