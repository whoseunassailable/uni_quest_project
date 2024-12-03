import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_quest_project/core/constants/routes.dart';
import 'package:uni_quest_project/core/widgets/questionnaire_layout.dart';
import '../../../l10n/app_localizations.dart';

class QuestionnairePage extends StatelessWidget {
  const QuestionnairePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> containerData = [
      {
        "text": "Undergraduate",
        "colorOfBorder": Colors.black,
        "colorOfContainer": Colors.white,
        "colorOfText": Colors.black,
      },
      {
        "text": "Postgraduate",
        "colorOfBorder": Colors.black,
        "colorOfContainer": Colors.white,
        "colorOfText": Colors.black,
      },
      {
        "text": "PhD",
        "colorOfBorder": Colors.black,
        "colorOfContainer": Colors.white,
        "colorOfText": Colors.black,
      },
    ];

    return QuestionnaireLayout(
      title: AppLocalizations.of(context).uniquest,
      questionText:
          AppLocalizations.of(context).whatIsYourPreferredLevelOfStudy,
      containerData: containerData,
      onTapOfButton: () => context.goNamed(RouteNames.preferredLocation),
      buttonText: AppLocalizations.of(context).next,
    );
  }
}
