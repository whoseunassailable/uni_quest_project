import 'package:flutter/material.dart';
import 'package:uni_quest_project/core/features/admission_percent_calculator/presentation/university_info_card.dart';
import 'package:uni_quest_project/core/utils/appbar.dart';

import '../../../../l10n/app_localizations.dart';

class AdmissionPercentCalculatorPage extends StatefulWidget {
  const AdmissionPercentCalculatorPage({super.key});

  @override
  State<AdmissionPercentCalculatorPage> createState() =>
      _AdmissionPercentCalculatorPageState();
}

class _AdmissionPercentCalculatorPageState
    extends State<AdmissionPercentCalculatorPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: StylishAppBar(
          title: AppLocalizations.of(context).admissionPercentageCalculator),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UniversityInfoCard(
            height: height * 0.25,
            width: width * 0.9,
            universityRank: 3,
            universityName: "Stanford",
            greScore: 328,
            toeflScore: 109,
            gpa: 3.9,
            universityCourse: 'AI/DS', toefl: '',
          ),
        ],
      ),
    );
  }
}
