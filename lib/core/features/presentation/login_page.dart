import 'package:flutter/material.dart';
import 'package:uni_quest_project/core/constants/app_colors.dart';
import 'package:uni_quest_project/core/constants/app_font_size.dart';
import 'package:uni_quest_project/core/utils/custom_text_form_field.dart';

import '../../../l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.bgColorForHomePage,
      body: SizedBox(
        width: width,
        child: Column(
          children: [
            SizedBox(
              height: height / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: width / 3,
                    child: Text(
                      AppLocalizations.of(context).registerAccount,
                      style: TextStyle(
                          fontSize: width * AppFontSize.xxxl,
                          fontWeight: FontWeight.w500,
                          color: AppColors.bgCoolWhiteColor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 2 / 3,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(width / 15, 0, width / 15, 0),
                    child: CustomTextFormField(
                        hintText:
                            AppLocalizations.of(context).pleaseCheckYourEmail),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  dynamicRowText({required double width, required String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(width / 7.5, width / 15, 0, 0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: width * AppFontSize.xl,
              color: AppColors.bgCoolWhiteColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
