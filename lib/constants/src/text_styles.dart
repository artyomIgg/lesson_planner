import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lesson_planner/constants/src/colors.dart' as c;

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
}