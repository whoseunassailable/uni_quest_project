import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:uni_quest_project/core/constants/app_colors.dart';
import 'package:uni_quest_project/core/constants/app_font_size.dart';
import 'package:uni_quest_project/core/features/services/api_service.dart';
import 'package:uni_quest_project/core/utils/appbar.dart';
import 'package:uni_quest_project/core/utils/custom_text_form_field.dart';
import 'package:uni_quest_project/core/widgets/minimalistic_button.dart';
import 'package:uuid/uuid.dart';
import '../../../l10n/app_localizations.dart';
import '../../constants/routes.dart';
import '../domain/student_model.dart';
import '../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Declare controllers for each text form field
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final uuid = const Uuid();
  final logger = Logger(printer: PrettyPrinter(colors: true));
  final _apiService = ApiService();

  @override
  void dispose() {
    // Dispose controllers when not in use
    _emailController.dispose();
    _nameController.dispose();
    _dobController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.bgColorForHomePage,
      appBar: StylishAppBar(title: AppLocalizations.of(context).uniquest),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: width * 0.35,
            child: Padding(
              padding: EdgeInsets.only(top: height / 25),
              child: Text(
                AppLocalizations.of(context).registerAccount,
                style: TextStyle(
                    fontSize: width * AppFontSize.xxxl,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor),
              ),
            ),
          ),
          listOfTextFormFields(height: height, width: width),
          SizedBox(
            height: height * 0.075,
            child: MinimalistButton(
              onPressed: () async {
                // Access the stored values from the controllers
                String email = _emailController.text;
                String name = _nameController.text;
                String dob = _dobController.text;
                String phone = _phoneController.text;
                String password = _passwordController.text;
                String confirmPassword = _confirmPasswordController.text;

                final firstName = name.split(' ').first;
                final lastName = name.split(' ').last;
                String formattedDOB = dob;

                logger.i('Email: $email');
                logger.i('Name: $name');
                logger.i('Date of Birth: $dob');
                logger.i('Phone: $phone');
                logger.i('Password: $password');
                logger.i('Confirm Password: $confirmPassword');

                // create student
                await _apiService.createStudent(
                  data: StudentModel(
                    studentId: uuid.v1(),
                    firstName: firstName,
                    lastName: lastName,
                    email: email,
                    phone: phone,
                    dateOfBirth: formattedDOB,
                    password: confirmPassword,
                  ).toJson(),
                );
                try {
                  await AuthService().saveStudentDetails(
                    studentId: uuid.v1(),
                    firstName: firstName,
                    lastName: lastName,
                    email: email,
                    phone: phone,
                    dateOfBirth: formattedDOB,
                    password: confirmPassword,
                  );
                } catch (e) {
                  logger.e(e.toString());
                }
                context.goNamed(RouteNames.homePage);
              },
              text: AppLocalizations.of(context).signUp,
            ),
          ),
        ],
      ),
    );
  }

  listOfTextFormFields({
    required double height,
    required double width,
  }) {
    List<String> listOfTextFormFields = [
      AppLocalizations.of(context).email,
      AppLocalizations.of(context).name,
      AppLocalizations.of(context).dob,
      AppLocalizations.of(context).phoneNumber,
      AppLocalizations.of(context).password,
      AppLocalizations.of(context).confirmPassword,
    ];

    List<TextEditingController> listOfTextEditingControllers = [
      _emailController,
      _nameController,
      _dobController,
      _phoneController,
      _passwordController,
      _confirmPasswordController
    ];

    List<bool> obscureTextList = [
      false, // Email (no obscuring)
      false, // Name (no obscuring)
      false, // DOB (no obscuring)
      false, // Phone Number (no obscuring)
      true, // Password (obscured)
      true, // Confirm Password (obscured)
    ];

    return SizedBox(
      height: height * 0.55,
      child: Padding(
        padding: EdgeInsets.fromLTRB(width / 15, 0, width / 15, 0),
        child: ListView.builder(
          itemCount: listOfTextFormFields.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                CustomTextFormField(
                  hintText: listOfTextFormFields[index],
                  controller: listOfTextEditingControllers[index],
                  obscureText: obscureTextList[
                      index], // Pass the correct obscureText value
                ),
                const SizedBox(height: 16.0),
              ],
            );
          },
        ),
      ),
    );
  }
}
