import 'package:flutter/material.dart';
import 'package:uni_quest_project/core/constants/app_colors.dart';
import 'package:uni_quest_project/core/constants/app_font_size.dart';
import 'package:uni_quest_project/core/utils/appbar.dart';
import 'package:uni_quest_project/core/utils/custom_text_form_field.dart';
import 'package:uni_quest_project/core/widgets/minimalistic_button.dart';

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
      appBar: StylishAppBar(title: AppLocalizations.of(context).uniquest),
      body: SizedBox(
        width: width,
        child: SizedBox(
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
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
              MinimalistButton(
                  onPressed: () {}, text: AppLocalizations.of(context).signUp),
              SizedBox(height: height / 14),
            ],
          ),
        ),
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
    return Expanded(
      flex: 3,
      child: Padding(
        padding: EdgeInsets.fromLTRB(width / 15, 0, width / 15, 0),
        child: ListView.builder(
          itemCount: listOfTextFormFields.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                CustomTextFormField(hintText: listOfTextFormFields[index]),
                const SizedBox(height: 16.0),
              ],
            );
          },
        ),
      ),
    );
  }
}
