import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;

  const CustomTextFormField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: AppColors.bgCoolWhiteColor,
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
