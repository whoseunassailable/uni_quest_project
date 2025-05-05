import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_quest_project/core/features/services/api_service.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../constants/routes.dart';
import '../../../widgets/questionnaire_layout.dart';

class PreferredGenre extends StatefulWidget {
  const PreferredGenre({super.key});

  @override
  State<PreferredGenre> createState() => _PreferredGenreState();
}

class _PreferredGenreState extends State<PreferredGenre> {
  final _apiService = ApiService();
  String? selectedGenre;

  final List<String> genreList = [
    // Literature / Media Genres
    "Action",
    "Adventure",
    "Animation",
    "Anthology",
    "Autobiography",
    "Biography",
    "Children",
    "Chick Lit",
    "Classic",
    "Comedy",
    "Comic Book",
    "Coming-of-Age",
    "Crime",
    "Cyberpunk",
    "Dark Fantasy",
    "Detective",
    "Drama",
    "Dystopian",
    "Educational",
    "Epic",
    "Erotica",
    "Espionage",
    "Fantasy",
    "Fiction",
    "Film-Noir",
    "Gothic",
    "Graphic Novel",
    "Hard Science Fiction",
    "Historical",
    "Historical Fiction",
    "Horror",
    "Humor",
    "Inspirational",
    "Interactive",
    "Legal Thriller",
    "Light Novel",
    "Literary Fiction",
    "Magic Realism",
    "Manga",
    "Martial Arts",
    "Memoir",
    "Military",
    "Music",
    "Musical",
    "Mystery",
    "Mythology",
    "Narrative Nonfiction",
    "New Adult",
    "Nonfiction",
    "Paranormal",
    "Philosophical",
    "Play",
    "Poetry",
    "Political",
    "Post-Apocalyptic",
    "Psychological Thriller",
    "Realistic Fiction",
    "Religion",
    "Romance",
    "Romantic Comedy",
    "Satire",
    "Science",
    "Science Fiction",
    "Self-help",
    "Short Story",
    "Slice of Life",
    "Space Opera",
    "Spirituality",
    "Spy",
    "Sports",
    "Superhero",
    "Supernatural",
    "Suspense",
    "Techno-thriller",
    "Teen",
    "Thriller",
    "Travel",
    "Tragedy",
    "Urban",
    "Urban Fantasy",
    "Utopian",
    "Visual Novel",
    "War",
    "Western",
    "Young Adult",
    "Zombie",
  ];

  @override
  Widget build(BuildContext context) {
    return QuestionnaireLayout(
      title: 'Smart Select',
      questionText: 'What genre are you most interested in?',
      containerData: const [],
      customInputField: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Select a genre',
          border: const OutlineInputBorder(),
        ),
        value: selectedGenre,
        items: genreList.map((genre) {
          return DropdownMenuItem<String>(
            value: genre,
            child: Text(genre),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedGenre = value;
          });
        },
      ),
      onTapOfButton: () async {
        if (selectedGenre != null) {
          final sharedPreferences = await SharedPreferences.getInstance();
          final userId = sharedPreferences.getString('user_id');

          if (userId != null) {
            await _apiService.updateStudent(
              studentId: userId,
              updates: {'preferred_genre': selectedGenre},
            );

            await sharedPreferences.setString(
              'preferred_genre',
              selectedGenre!,
            );

            context.goNamed(RouteNames.bookRecommendationPage);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('User ID not found.')),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Please select a genre')),
          );
        }
      },
      buttonText: AppLocalizations.of(context).next,
    );
  }
}
