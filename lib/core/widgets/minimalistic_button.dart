import 'package:flutter/material.dart';

class MinimalistButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  MinimalistButton({required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width * 0.4, // Adjust the button width to be 80% of screen width
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          // Ensure the text is centered within the button
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18, // Slightly bigger font size for better readability
              fontWeight: FontWeight.bold, // Bolder text for better visibility
            ),
          ),
        ),
      ),
    );
  }
}
