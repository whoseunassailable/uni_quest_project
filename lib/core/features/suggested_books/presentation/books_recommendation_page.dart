import 'package:flutter/material.dart';
import 'package:uni_quest_project/core/utils/appbar.dart';
import '../../../utils/book_info_card.dart';

class BookRecommendationPage extends StatelessWidget {
  const BookRecommendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final books = [
      {
        "title": "1984",
        "author": "George Orwell",
        "genre": "Fiction",
        "rating": 4.6,
      },
      {
        "title": "Sapiens",
        "author": "Yuval Noah Harari",
        "genre": "Non-Fiction",
        "rating": 4.8,
      },
      {
        "title": "Deep Learning",
        "author": "Ian Goodfellow",
        "genre": "AI",
        "rating": 4.9,
      },
    ];

    return Scaffold(
      appBar: StylishAppBar(title: 'Book Recommendations'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: ListView.separated(
          itemCount: books.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final book = books[index];
            return BookInfoCard(
              height: height * 0.22,
              width: width * 0.9,
              title: book["title"] as String,
              author: book["author"] as String,
              genre: book["genre"] as String,
              rating: book["rating"] as double,
            );
          },
        ),
      ),
    );
  }
}
