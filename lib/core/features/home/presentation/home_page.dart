import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_quest_project/core/constants/app_colors.dart';
import 'package:uni_quest_project/core/constants/routes.dart';
import 'package:uni_quest_project/core/widgets/dynamic_container.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../utils/appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of widgets for each tab
  final List<String> _pages = [
    RouteNames.profilePage,
    // RouteNames.updateInfoPage,
    RouteNames.logoutPage,
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: StylishAppBar(title: AppLocalizations.of(context).uniquest),
      backgroundColor: AppColors.bgColorForHomePage,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              RoundedContainer(
                onTapOfContainer: () =>
                    context.goNamed(RouteNames.preferredLocation),
                text: AppLocalizations.of(context).findTopUniversities,
                height: height,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          // Navigate to the selected page
          setState(() {
            _selectedIndex = index;
          });
          context.goNamed(_pages[index]);
        }, //
        backgroundColor: Colors.lightGreenAccent,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType
            .fixed, // Allows more than 3 items in the nav bar
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.edit),
          //   label: 'Update Info',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Log out',
          ),
        ],
      ),
    );
  }

  dynamicRow({
    required BuildContext context,
    required double height,
    required double width,
    required String text_one,
    required String text_two,
    required void Function()? onTapOfContainerOne,
    required void Function()? onTapOfContainerTwo,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RoundedContainer(
          onTapOfContainer: onTapOfContainerOne,
          text: text_one,
          height: height,
        ),
        SizedBox(width: width / 15),
        RoundedContainer(
          onTapOfContainer: onTapOfContainerTwo,
          text: text_two,
          height: height,
        )
      ],
    );
  }
}
