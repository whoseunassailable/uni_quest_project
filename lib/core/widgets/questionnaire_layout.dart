import 'package:flutter/material.dart';
import 'package:uni_quest_project/core/widgets/aesthetic_input_field.dart';
import 'package:uni_quest_project/core/widgets/minimalistic_button.dart';
import 'package:uni_quest_project/core/widgets/question_box_containter.dart';
import '../constants/app_colors.dart';
import '../utils/appbar.dart';

class QuestionnaireLayout extends StatelessWidget {
  final String title;
  final String? questionText;
  final String hintTextForInputField;
  final TextEditingController controller;
  final List<Map<String, dynamic>> containerData;
  // final void Function(int index)? onItemTap;
  final void Function() onTapOfButton;
  final String buttonText;

  const QuestionnaireLayout({
    super.key,
    required this.title,
    required this.questionText,
    required this.containerData,
    required this.onTapOfButton,
    required this.buttonText,
    required this.hintTextForInputField,
    required this.controller,
    // this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.bgColorForAppBar,
      appBar: StylishAppBar(title: title),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
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
                  children: [
                    QuestionBoxContainer(
                      height: height,
                      width: width,
                      text: questionText,
                    ),
                    SizedBox(height: height / 50),
                    AestheticInputField(
                      hintText: hintTextForInputField,
                      controller: controller,
                    ),
                    SizedBox(height: height / 50),

                    // SizedBox(
                    //   height: height * 0.4,
                    //   child: ListView.builder(
                    //     itemCount: containerData.length,
                    //     itemBuilder: (context, index) {
                    //       final data = containerData[index];
                    //       return Column(
                    //         children: [
                    //           QuestionBoxContainer(
                    //             height: height * 0.7,
                    //             width: width * 0.85,
                    //             text: data["text"],
                    //             colorOfBorder: data["colorOfBorder"],
                    //             colorOfContainer: data["colorOfContainer"],
                    //             colorOfText: data["colorOfText"],
                    //             // onTapOfContainer: () {
                    //             //   if (onItemTap != null) {
                    //             //     onItemTap!(index);
                    //             //   }
                    //             // },
                    //           ),
                    //           SizedBox(height: height / 50),
                    //         ],
                    //       );
                    //     },
                    //   ),
                    // ),
                    MinimalistButton(
                        onPressed: onTapOfButton, text: buttonText),
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
