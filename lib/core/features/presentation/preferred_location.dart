import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../l10n/app_localizations.dart';
import '../../constants/routes.dart';
import '../../widgets/questionnaire_layout.dart';

class PreferredLocation extends StatelessWidget {
  const PreferredLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();

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
      onTapOfButton: () {
        context.goNamed(RouteNames.toeflPage);
      },
      buttonText: AppLocalizations.of(context).next,
      hintTextForInputField:
          AppLocalizations.of(context).inputYourPreferredLocation,
      controller: textEditingController,
    );
  }
}
