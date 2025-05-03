import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_quest_project/core/features/services/api_service.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../constants/routes.dart';
import '../../../widgets/questionnaire_layout.dart';

class PreferredLocation extends StatefulWidget {
  const PreferredLocation({super.key});

  @override
  State<PreferredLocation> createState() => _PreferredLocationState();
}

class _PreferredLocationState extends State<PreferredLocation> {
  final _apiService = ApiService();
  String? selectedCountry;

  final List<String> countryList = [
    "United States",
    "United Kingdom",
    "Australia",
    "Germany",
    "Canada",
    "France",
    "India",
    "China",
    "Japan",
    "South Korea",
    "Netherlands",
    "Sweden",
    "Switzerland",
    "New Zealand",
    "Singapore",
    "Ireland",
    "Italy",
    "Spain",
    "Norway",
    "Finland",
    "Denmark",
    "Belgium",
    "Austria",
    "Russia",
    "Brazil",
    "Mexico",
    "South Africa",
    "Malaysia",
    "UAE",
    "Turkey",
    // Add more if needed
  ];

  @override
  Widget build(BuildContext context) {
    return QuestionnaireLayout(
      title: AppLocalizations.of(context).uniquest,
      questionText:
      AppLocalizations.of(context).whichCountriesDoYouPreferToStudyIn,
      containerData: const [], // Not used here
      customInputField: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context).inputYourPreferredLocation,
          border: const OutlineInputBorder(),
        ),
        value: selectedCountry,
        items: countryList.map((country) {
          return DropdownMenuItem<String>(
            value: country,
            child: Text(country),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedCountry = value;
          });
        },
      ),
      onTapOfButton: () async {
        if (selectedCountry != null) {
          final sharedPreferences = await SharedPreferences.getInstance();
          final studentId = sharedPreferences.getString('student_id');

          if (studentId != null) {
            await _apiService.updateStudent(
              studentId: studentId,
              updates: {'preferred_location': selectedCountry},
            );

            await sharedPreferences.setString(
              'preferred_location',
              selectedCountry!,
            );

            context.goNamed(RouteNames.toeflPage);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Student ID not found.')),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Please select a country')),
          );
        }
      },
      buttonText: AppLocalizations.of(context).next,
    );
  }
}


