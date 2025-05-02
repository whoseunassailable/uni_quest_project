import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uni_quest_project/core/features/admission_percent_calculator/presentation/university_info_card.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xFFFFCC80),
      appBar: AppBar(
        title: const Text('Your Wishlist'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.filter_list),
            onSelected: (String value) {
              // You can filter the wishlist based on selected value here
              if (kDebugMode) {
                print('Selected filter: $value');
              }
              // TODO: Add your filtering logic
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Safe',
                child: Text('Safe'),

              ),
              const PopupMenuItem<String>(
                value: 'Target',
                child: Text('Target'),
              ),
              const PopupMenuItem<String>(
                value: 'Dream',
                child: Text('Dream'),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Color(0xFFFDF7EF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hey there! 👋 Here’s what you’ve searched for",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 1, // Replace with your wishlist length
                itemBuilder: (context, index) {
                  return UniversityInfoCard(
                    height: 220,
                    width: MediaQuery.of(context).size.width * 0.9,
                    universityRank: 5, // ✅ Integer
                    universityName: "MIT", // ✅ String
                    greScore: 320, // ✅ Integer
                    toeflScore: 105, // ✅ Integer
                    gpa: 3.9, // ✅ Double
                    universityCourse: "Computer Science", // ✅ String
                    toefl: "TOEFL iBT", // ✅ String
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
