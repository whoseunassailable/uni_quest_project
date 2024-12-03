import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_quest_project/l10n/app_localizations.dart';

import '../../constants/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffF9AA33),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context).yourJourneyToFindPerfectUniversity,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height / 25),
            TextField(
              controller: usernameController,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).username,
                labelStyle: const TextStyle(color: Colors.black), // Label text white
                fillColor: Colors.white,
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(height: height / 40),
            TextField(
              controller: passwordController,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).password,
                labelStyle: const TextStyle(color: Colors.black), // Label text white
                fillColor: Colors.white,
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
              obscureText: true,
            ),
            SizedBox(height: height / 40),
            GestureDetector(
              onTap: () {
                // Handle forgot password
              },
              child: const Text(
                "Forgot Password?",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(height: height / 40),
            SizedBox(height: height / 80),
            ElevatedButton(
              onPressed: () {
                final username = usernameController.text;
                final password = passwordController.text;
                context.goNamed(RouteNames.homePage);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // White background color
                side: const BorderSide(color: Colors.white, width: 2), // Black border
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
                minimumSize: const Size(250, 50), // Increased width (250) and height (50)
              ),
              child: Text(
                AppLocalizations.of(context).login,
                style: const TextStyle(color: Colors.white, fontSize: 16), // Black text
              ),
            ),
            SizedBox(height: height / 40),
            ElevatedButton(
              onPressed: () => context.goNamed(RouteNames.signUpPage),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // White background color
                side: const BorderSide(color: Colors.black, width: 2), // Black border
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
              ),
              child: Text(
                AppLocalizations.of(context).signUp,
                style: const TextStyle(color: Colors.black), // Black text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
