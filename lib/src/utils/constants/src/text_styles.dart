import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart' as c;

mixin TextStyles {
  static TextStyle appBarTitle = GoogleFonts.poppins(
    fontSize: 24,
    color: c.Colors.black,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textFieldLabel = GoogleFonts.poppins(
    fontSize: 18,
    color: c.Colors.black,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textFieldText = GoogleFonts.poppins(
    fontSize: 16,
    color: c.Colors.black,
  );

  // MyCalendarScreen

  static TextStyle meetCardTitleWhite = GoogleFonts.poppins(
    fontSize: 16,
    color: c.Colors.white,
    fontWeight: FontWeight.w700,
  );

  static TextStyle meetCardTitleBlack = GoogleFonts.poppins(
    fontSize: 16,
    color: c.Colors.black,
    fontWeight: FontWeight.w700,
  );

  static TextStyle meetCardDescriptionWhite = GoogleFonts.poppins(
    fontSize: 12,
    color: c.Colors.white,
    fontWeight: FontWeight.w500,
  );

  static TextStyle meetCardDescriptionBlack = GoogleFonts.poppins(
    fontSize: 12,
    color: c.Colors.black,
    fontWeight: FontWeight.w500,
  );
  
  static TextStyle meetCardStartTime = GoogleFonts.poppins(
    fontSize: 16,
    color: c.Colors.black,
    fontWeight: FontWeight.w600,
  );
  
  static TextStyle meetCardEndTime = GoogleFonts.poppins(
    fontSize: 14,
    color: c.Colors.black.withOpacity(.5),
    fontWeight: FontWeight.w500,
  );
}