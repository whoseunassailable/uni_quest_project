import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class StylishAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const StylishAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: height / 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'Oswald',
        ),
      ),
      backgroundColor: const Color(0xFFF3A436), // Background color
      elevation: 4.0, // Shadow for depth
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(MaterialCommunityIcons.menu, color: Colors.white),
        onPressed: () {
          Navigator.of(context).pop(); // Navigate back
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(MaterialIcons.settings, color: Colors.white),
          onPressed: () {
            // Add notification functionality
          },
        ),
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16.0), // Rounded bottom corners
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
