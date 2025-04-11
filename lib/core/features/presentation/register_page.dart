import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:uni_quest_project/core/constants/app_colors.dart';
import 'package:uni_quest_project/core/constants/app_font_size.dart';
import 'package:uni_quest_project/core/features/services/api_service.dart';
import 'package:uni_quest_project/core/utils/animated_text.dart';
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
  final AnimatedMessage animatedMessage = AnimatedMessage();
  String animatedWelcomeMessage = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => animatedMessage.animatedWelcome(
        context: context,
        textMessage: AppLocalizations.of(context).welcomeMessage,
        onUpdate: (text) => setState(() => animatedWelcomeMessage = text),
      ),
    );
  }

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
      backgroundColor: AppColors.darkYellow,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: width * 0.35,
            child: Padding(
              padding: EdgeInsets.only(top: height / 25),
              child: Text(
                animatedWelcomeMessage,
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

                if (password == confirmPassword) {
                  final firstName = name.split(' ').first;
                  final lastName = name.split(' ').last;
                  String formattedDOB = dob;

                  // logger.i('Email: $email');
                  // logger.i('Name: $name');
                  // logger.i('Date of Birth: $dob');
                  // logger.i('Phone: $phone');
                  // logger.i('Password: $password');
                  // logger.i('Confirm Password: $confirmPassword');

                  final studentId = uuid.v1();
                  // create student
                  await _apiService.createStudent(
                    data: StudentModel(
                      studentId: studentId,
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
                      studentId: studentId,
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
                }
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

    const List<Icon> listOfIcons = [
      Icon(MaterialCommunityIcons.email), // Email
      Icon(MaterialCommunityIcons.account), // Name
      Icon(MaterialCommunityIcons.calendar), // Date of Birth (DOB)
      Icon(MaterialCommunityIcons.phone), // Phone Number
      Icon(MaterialCommunityIcons.lock), // Password
      Icon(MaterialCommunityIcons.lock_check), // Confirm Password
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
                  prefixIcon: listOfIcons[index],
                  obscureText: obscureTextList[index],
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
