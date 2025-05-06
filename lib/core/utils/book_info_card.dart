import 'package:flutter/material.dart';

class BookInfoCard extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final String author;
  final double rating;
  final String genre;
  final String? imageUrl;

  const BookInfoCard({
    super.key,
    required this.height,
    required this.width,
    required this.title,
    required this.author,
    required this.rating,
    required this.genre,
    this.imageUrl,
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
      child: Row(
        children: [
          // Left: Book Info
          Expanded(
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

                // Genre
                Text(
                  "Genre: $genre",
                  style: TextStyle(
                    color: textColor.withOpacity(0.75),
                    fontSize: 14,
                  ),
                ),

                const Spacer(),

                // Rating
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
          ),

          const SizedBox(width: 12),

          // Right: Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              (imageUrl != null && imageUrl!.isNotEmpty)
                  ? imageUrl!
                  : 'https://via.placeholder.com/100x150?text=No+Image',
              width: 100,
              height: 150,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.network(
                  'https://via.placeholder.com/100x150?text=No+Image',
                  width: 100,
                  height: 150,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
