import 'package:flutter/material.dart';
import '../../../l10n/app_localizations.dart';
import '../../constants/app_colors.dart';
import '../../utils/appbar.dart';
import '../../utils/text_styles.dart';

class QuestionnairePage extends StatelessWidget {
  const QuestionnairePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.bgColorForAppBar, // Background color
      appBar: StylishAppBar(title: AppLocalizations.of(context).uniquest),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width * 0.9,
                height: height * 0.65,
                padding: EdgeInsets.only(top: height / 20),
                decoration: BoxDecoration(
                  color: AppColors.bgColorForHomePage,
                  border: Border.all(color: AppColors.containerColor),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: height * 0.075,
                      width: width * 0.85,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: AppColors.containerColor),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Text(
                        AppLocalizations.of(context)
                            .whatIsYourPreferredLevelOfStudy,
                        style: TextStyles.bodyText(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
