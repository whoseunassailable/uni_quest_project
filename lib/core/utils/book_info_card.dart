import 'package:flutter/material.dart';

class BookInfoCard extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final String author;
  final double rating;
  final String genre;
  final String classification;

  const BookInfoCard({
    super.key,
    required this.height,
    required this.width,
    required this.title,
    required this.author,
    required this.rating,
    required this.genre,
    required this.classification,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final cardBackground = Theme.of(context).colorScheme.surface;
    final textColor =
        Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;

    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: primaryColor, width: 2),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),

          // Author
          Text(
            "by $author",
            style: TextStyle(
              color: textColor.withOpacity(0.7),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 12),

          // Genre and Class
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Genre: $genre",
                style: TextStyle(
                  color: textColor.withOpacity(0.75),
                  fontSize: 14,
                ),
              ),
              Text(
                "Level: $classification",
                style: TextStyle(
                  color: textColor.withOpacity(0.75),
                  fontSize: 14,
                ),
              ),
            ],
          ),

          const Spacer(),

          // Rating
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "⭐ $rating",
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
