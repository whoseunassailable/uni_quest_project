import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_quest_project/core/features/services/api_service.dart';

import '../../../l10n/app_localizations.dart';
import '../../constants/app_colors.dart';
import '../../utils/appbar.dart';
import '../../widgets/searched_university_name_container.dart';
import '../domain/university_model.dart';

class SearchedUniversities extends StatefulWidget {
  const SearchedUniversities({super.key});

  @override
  State<SearchedUniversities> createState() => _SearchedUniversitiesState();
}

class _SearchedUniversitiesState extends State<SearchedUniversities> {
  // Profile information
  String greScore = '';
  String toeflScore = '';
  String preferredLocation = '';
  final _apiservice = ApiService();
  List<dynamic>? universities; // Store the search results

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      greScore = sharedPreferences.getString('gre_score') ?? '';
      toeflScore = sharedPreferences.getString('toefl_score') ?? '';
      preferredLocation =
          sharedPreferences.getString('preferred_location') ?? '';
    });
  }

  Future<void> _searchUniversities() async {
    try {
      final result = await _apiservice.searchUniversities(
        minGre: greScore.isNotEmpty ? int.parse(greScore) : 0,
        minToefl: toeflScore.isNotEmpty ? int.parse(toeflScore) : 0,
        preferredLocation: preferredLocation,
      );

      setState(() {
        universities = result; // Store the results in the state
      });
      print(universities);
    } catch (e) {
      // Handle any errors here
      print('Error during API call: $e');
      setState(() {
        universities = []; // Clear the data on error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.bgColorForAppBar,
      appBar: StylishAppBar(title: AppLocalizations.of(context).uniquest),
      floatingActionButton: FloatingActionButton(
        onPressed: _searchUniversities, // Call the search function when pressed
        child: Icon(Icons.search),
      ),
      body: universities == null
          ? const Center(child: Text('Press the button to search universities'))
          : universities!.isEmpty
              ? const Center(child: Text('No universities found'))
              : Column(
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
                          child: ListView.builder(
                            itemCount: universities!.length,
                            itemBuilder: (context, index) {
                              final university = universities![index];
                              return SearchedUniversityNameContainer(
                                height: height * 0.35,
                                width: width * 0.8,
                                universityName: university['name'] ?? '',
                                greScore: university['greScore'] ?? '',
                                toeflScore: university['toeflScore'] ?? '',
                                tuitionFees:
                                    university['tuitionFees']?.toString() ??
                                        'N/A',
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
    );
  }
}
