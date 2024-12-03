import 'package:flutter/material.dart';
import 'package:flutter_asset_generator/logger.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_quest_project/core/features/domain/student_model.dart';
import 'package:uni_quest_project/core/features/services/api_service.dart';
import 'package:uni_quest_project/core/features/services/auth_service.dart';
import 'package:flutter_asset_generator/logger.dart';

import '../../../l10n/app_localizations.dart';
import '../../constants/routes.dart';
import '../../widgets/questionnaire_layout.dart';

class PreferredLocation extends StatelessWidget {
  const PreferredLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    final _apiservice = ApiService();
    final List<Map<String, dynamic>> containerData = [
      {
        "text": AppLocalizations.of(context).usa,
        "colorOfBorder": Colors.black,
        "colorOfContainer": Colors.white,
        "colorOfText": Colors.black,
      },
      {
        "text": AppLocalizations.of(context).uk,
        "colorOfBorder": Colors.blue,
        "colorOfContainer": Colors.lightBlue.shade50,
        "colorOfText": Colors.blue,
      },
      {
        "text": AppLocalizations.of(context).australia,
        "colorOfBorder": Colors.green,
        "colorOfContainer": Colors.lightGreen.shade50,
        "colorOfText": Colors.green,
      },
      {
        "text": AppLocalizations.of(context).germany,
        "colorOfBorder": Colors.teal,
        "colorOfContainer": Colors.tealAccent,
        "colorOfText": Colors.teal,
      },
    ];

    return QuestionnaireLayout(
      title: AppLocalizations.of(context).uniquest,
      questionText:
          AppLocalizations.of(context).whichCountriesDoYouPreferToStudyIn,
      containerData: containerData,
      onTapOfButton: () async {
        final sharedPreferences = await SharedPreferences.getInstance();
        final studentId = sharedPreferences.getString('student_id');
        String firstName = sharedPreferences.getString('first_name') ?? '';
        String lastName = sharedPreferences.getString('last_name') ?? '';
        String email = sharedPreferences.getString('email') ?? '';
        String phone = sharedPreferences.getString('phone') ?? '';
        String dateOfBirth = sharedPreferences.getString('date_of_birth') ?? '';
        String password = sharedPreferences.getString('password') ?? '';
        print('studentId : $studentId');
        _apiservice.updateStudent(studentId: studentId!, data: {
          'student_id': studentId,
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'preferred_location': textEditingController.text,
          'phone': phone,
          'date_of_birth': dateOfBirth,
          'password': password,
        });
        // sharedPreferences.setString(
        //     'preferred_location', textEditingController.text);
        context.goNamed(RouteNames.toeflPage);
      },
      buttonText: AppLocalizations.of(context).next,
      hintTextForInputField:
          AppLocalizations.of(context).inputYourPreferredLocation,
      controller: textEditingController,
    );
  }
}
