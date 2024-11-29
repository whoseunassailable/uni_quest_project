import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_quest_project/core/constants/app_colors.dart';
import 'package:uni_quest_project/core/constants/app_font_size.dart';
import 'package:uni_quest_project/core/utils/appbar.dart';
import 'package:uni_quest_project/core/utils/custom_text_form_field.dart';
import 'package:uni_quest_project/core/widgets/minimalistic_button.dart';

import '../../../l10n/app_localizations.dart';
import '../../constants/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Declare controllers for each text form field
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
              onPressed: () {
                // Access the stored values from the controllers
                String email = _emailController.text;
                String name = _nameController.text;
                String dob = _dobController.text;
                String phone = _phoneController.text;
                String password = _passwordController.text;
                String confirmPassword = _confirmPasswordController.text;

                // You can now use these values as needed
                print('Email: $email');
                print('Name: $name');
                print('Date of Birth: $dob');
                print('Phone: $phone');
                print('Password: $password');
                print('Confirm Password: $confirmPassword');
                context.goNamed(RouteNames.signUpPage);
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
