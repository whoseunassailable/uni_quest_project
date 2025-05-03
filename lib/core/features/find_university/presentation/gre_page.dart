import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../constants/routes.dart';
import '../../../widgets/questionnaire_layout.dart';
import '../../services/api_service.dart';

class GrePage extends StatefulWidget {
  const GrePage({super.key});

  @override
  State<GrePage> createState() => _GrePageState();
}

class _GrePageState extends State<GrePage> {
  late TextEditingController verbalController;
  late TextEditingController quantitativeController;
  late TextEditingController analyticalController;

  @override
  void initState() {
    super.initState();
    verbalController = TextEditingController();
    quantitativeController = TextEditingController();
    analyticalController = TextEditingController();
  }

  @override
  void dispose() {
    verbalController.dispose();
    quantitativeController.dispose();
    analyticalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> containerData = [
      {
        "text": AppLocalizations.of(context).two_sixty_to_three_hundred,
        "colorOfBorder": Colors.black,
        "colorOfContainer": Colors.white,
        "colorOfText": Colors.black,
      },
      {
        "text": AppLocalizations.of(context).three_hundred_to_three_hundred_nineteen,
        "colorOfBorder": Colors.blue,
        "colorOfContainer": Colors.lightBlue.shade50,
        "colorOfText": Colors.blue,
      },
      {
        "text": AppLocalizations.of(context).three_twenty_to_three_forty,
        "colorOfBorder": Colors.green,
        "colorOfContainer": Colors.lightGreen.shade50,
        "colorOfText": Colors.green,
      },
      {
        "text": AppLocalizations.of(context).eight_to_nine,
        "colorOfBorder": Colors.teal,
        "colorOfContainer": Colors.tealAccent,
        "colorOfText": Colors.teal,
      },
    ];

    return QuestionnaireLayout(
      title: AppLocalizations.of(context).uniquest,
      questionText: AppLocalizations.of(context).whatAreYourGREScores,
      containerData: containerData,
      onTapOfButton: () async {
        final sharedPreferences = await SharedPreferences.getInstance();
        final studentId = sharedPreferences.getString('student_id');

        if (studentId == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Student ID not found. Please log in again.')),
          );
          return;
        }

        final _apiservice = ApiService();

        final greData = {
          'verbal': verbalController.text,
          'quantitative': quantitativeController.text,
          'analytical': analyticalController.text,
        };

        await _apiservice.updateStudent(
          studentId: studentId,
          updates: {
            'gre_scores': greData,
          },
        );

        sharedPreferences.setString('gre_verbal', greData['verbal']!);
        sharedPreferences.setString('gre_quantitative', greData['quantitative']!);
        sharedPreferences.setString('gre_analytical', greData['analytical']!);

        context.goNamed(RouteNames.searchedUniversities);
      },
      buttonText: AppLocalizations.of(context).next,
      hintTextForInputField: AppLocalizations.of(context).inputYourGREScore,
      controller: null, // Not using single controller anymore
      additionalFields: [
        {
          'label': 'Verbal Score',
          'controller': verbalController,
          'hint': 'Enter your verbal score',
        },
        {
          'label': 'Quantitative Score',
          'controller': quantitativeController,
          'hint': 'Enter your quantitative score',
        },
        {
          'label': 'Analytical Writing Score',
          'controller': analyticalController,
          'hint': 'Enter your analytical writing score',
        },
      ],
    );
  }
}
