import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle appBarText = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
  static TextStyle buttonText = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.w800,
    fontFamily: GoogleFonts.inter().fontFamily,
  );
  static TextStyle dialogText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    fontFamily: GoogleFonts.inter().fontFamily,
  );
}
