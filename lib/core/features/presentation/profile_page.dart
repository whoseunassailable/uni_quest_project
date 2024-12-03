import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String email = "example@example.com";
  String phone = "1234567890";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person, size: 100),
            // Text(
            //   widget.firstName,
            //   style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            // ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Change Email",
                border: const OutlineInputBorder(),
                hintText: email,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: "Change Mobile",
                border: const OutlineInputBorder(),
                hintText: phone,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (emailController.text.isNotEmpty) {
                    email = emailController.text;
                  }
                  if (phoneController.text.isNotEmpty) {
                    phone = phoneController.text;
                  }
                });
              },
              child: const Text('Update'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
