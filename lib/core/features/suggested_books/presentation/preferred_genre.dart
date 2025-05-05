import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
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
  List<String> selectedGenres = [];
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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

    return QuestionnaireLayout(
      title: 'Smart Select',
      questionText: 'What genre are you most interested in?',
      containerData: const [],
      customInputField: MultiSelectDialogField<String>(
        items: genreList.map((genre) => MultiSelectItem(genre, genre)).toList(),
        title: Text('Select Genres'),
        selectedColor: Theme.of(context).primaryColor,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: Colors.grey),
        ),
        buttonIcon: Icon(Icons.arrow_drop_down),
        buttonText: Text('Select genres'),
        onConfirm: (values) => selectedGenres = values,
        chipDisplay: MultiSelectChipDisplay(
          onTap: (value) => selectedGenres.remove(value),
        ),
      ),
      onTapOfButton: () async {
        final apiService = ApiService();
        if (selectedGenres.isNotEmpty) {
          final sharedPreferences = await SharedPreferences.getInstance();
          final userId = sharedPreferences.getString('user_id');

          if (userId != null) {
            await apiService.updateStudent(
              studentId: userId,
              updates: {'preferred_genres': selectedGenres},
            );

            await sharedPreferences.setStringList(
              'preferred_genres',
              selectedGenres,
            );

            context.goNamed(RouteNames.bookRecommendationPage);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('User ID not found.')),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Please select at least one genre')),
          );
        }
      },
      buttonText: AppLocalizations.of(context).next,
      hintTextForInputField: '',
      controller: null,
    );
  }
}
