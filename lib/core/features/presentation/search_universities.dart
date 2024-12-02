import 'package:flutter/material.dart';
import 'package:uni_quest_project/core/utils/text_styles.dart';
import 'package:uni_quest_project/core/widgets/searched_university_name_container.dart';
import 'package:uni_quest_project/l10n/app_localizations.dart';

import '../../constants/app_colors.dart';
import '../../utils/appbar.dart';
import '../../widgets/question_box_containter.dart';

class SearchedUniversities extends StatelessWidget {
  const SearchedUniversities({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.bgColorForAppBar,
      appBar: StylishAppBar(title: AppLocalizations.of(context).uniquest),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width * 0.9,
                height: height * 0.85,
                padding: EdgeInsets.all(height / 40),
                decoration: BoxDecoration(
                  color: AppColors.bgColorForHomePage,
                  border: Border.all(color: AppColors.containerColor),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context).basedOnYour,
                      style: TextStyles.headline(),
                    ),
                    SizedBox(height: height / 30),
                    SearchedUniversityNameContainer(
                        height: height * 0.35,
                        width: width * 0.8,
                        universityName: 'University Name',
                        greScore: '320',
                        gmatScore: '680',
                        toeflScore: '87',
                        ieltsScore: '8.0',
                        tuitionFees: '27739')
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
