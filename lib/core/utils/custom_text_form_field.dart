import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller; // Add this

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller, // Add this
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, // Use the controller here
      style: const TextStyle(
        color: AppColors.blackColor,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[400]),
        filled: true,
        fillColor: AppColors.bgCoolWhiteColor.withOpacity(1.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: AppColors.bgCoolWhiteColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
      ),
    );
  }
}
