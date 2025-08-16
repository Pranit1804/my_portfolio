import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle headline(double size) => GoogleFonts.jetBrainsMono(
    fontSize: size,
    fontWeight: FontWeight.w700,
    color: AppColors.text,
    height: 1.1,
  );

  static TextStyle subhead(double size) => GoogleFonts.inter(
    fontSize: size,
    fontWeight: FontWeight.w500,
    color: AppColors.accent,
    height: 1.3,
  );

  static TextStyle body(double size, {Color? color}) => GoogleFonts.inter(
    fontSize: size,
    fontWeight: FontWeight.w400,
    color: color ?? AppColors.subtext,
    height: 1.6,
  );

  static TextStyle button(double size) => GoogleFonts.inter(
    fontSize: size,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    letterSpacing: .3,
  );

  static TextStyle sectionTitle(double size) => GoogleFonts.jetBrainsMono(
    fontSize: size,
    fontWeight: FontWeight.w700,
    color: AppColors.accent,
    height: 1.2,
  );
}
