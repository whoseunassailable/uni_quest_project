import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_quest_project/core/constants/routes.dart';
import 'package:uni_quest_project/core/features/services/api_service.dart';
import 'package:uni_quest_project/core/features/services/auth_service.dart';
import 'package:uni_quest_project/l10n/app_localizations.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false; // Flag to toggle between edit and view mode
  final _apiservice = ApiService();
  final _authservice = AuthService();

  // Profile information
  String firstName = '';
  String lastName = '';
  String email = '';
  String phone = '';
  String dateOfBirth = '';

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      firstName = sharedPreferences.getString('first_name') ?? '';
      lastName = sharedPreferences.getString('last_name') ?? '';
      email = sharedPreferences.getString('email') ?? '';
      phone = sharedPreferences.getString('phone') ?? '';
      dateOfBirth = sharedPreferences.getString('date_of_birth') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFFFFAF2), // Set background color to #FFFAF2
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.orange, // Orange color for the profile bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profile Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            // Profile fields with data from SharedPreferences
            _buildTextField(firstName, isEditing),
            const SizedBox(height: 15),
            _buildTextField(lastName, isEditing),
            const SizedBox(height: 15),
            _buildTextField(dateOfBirth, isEditing),
            const SizedBox(height: 15),
            _buildTextField(email, isEditing),
            const SizedBox(height: 15),
            _buildTextField(phone, isEditing),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => context.goNamed(RouteNames.homePage),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(AppLocalizations.of(context).home),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final sharedPreferences =
                        await SharedPreferences.getInstance();
                    final studentId = sharedPreferences.getString('student_id');
                    await _apiservice.deleteStudent(studentId!);
                    context.goNamed(RouteNames.loginPage);
                    _authservice.clearStudentDetails();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(AppLocalizations.of(context).delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Method to build a text field with a label and value
  Widget _buildTextField(String label, bool editable) {
    return TextField(
      enabled: editable,
      style: const TextStyle(color: Colors.black), // Black text color
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black), // Black label text
        hintStyle:
            const TextStyle(color: Colors.black54), // Grey placeholder text
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black), // Black border
        ),
        filled: true,
        fillColor: Colors.white, // White background for the text field
      ),
    );
  }
}
