import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  // Google Fonts for AppBar Title
  static TextStyle appBarTitle() {
    return GoogleFonts.lobster(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );
  }

  // Google Fonts for Body Text
  static TextStyle bodyText() {
    return GoogleFonts.openSans(
      fontSize: 16,
    );
  }

  // Google Fonts for Button Text
  static TextStyle buttonText() {
    return GoogleFonts.roboto(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
  }

  // Google Fonts for Headline or Larger Text
  static TextStyle headline() {
    return GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.w700,
    );
  }

  // Google Fonts for Paragraph or Smaller Text
  static TextStyle paragraph() {
    return GoogleFonts.nunito(
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }

  // Google Fonts with Dynamic Size and Optional Weight
  static TextStyle dynamicFont(double size,
      {FontWeight weight = FontWeight.normal}) {
    return GoogleFonts.montserrat(
      fontSize: size,
      fontWeight: weight,
    );
  }
}
